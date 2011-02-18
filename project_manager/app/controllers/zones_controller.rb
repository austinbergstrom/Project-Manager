class ZonesController < ApplicationController

  def add
    @new = true
    zone = Zone.create(:project_id=>params[:id])
    respond_to do |f|
      f.js do
        render :update do |page|
          partial = render(:partial=>"/zones/zone_line_item", :locals=>{:zone=>zone})
          page << "$('#zoneList').prepend(#{partial.to_json});"
        end
      end
    end
  end

  # GET /zones/1/edit
  def edit
    @zone = Zone.find(params[:id])
    respond_to do |f|
      f.js do
        render :update do |page|
          html = render(:partial=>"/zones/line_item_form", :locals=>{:zone=>@zone})
          page << "$('#zone_#{@zone.id.to_s}').html(#{html.to_json})"
        end
      end
    end
  end

  # POST /zones
  # POST /zones.xml
  def create
    @zone = Zone.new(params[:zone])

    respond_to do |format|
      if @zone.save
        format.html { redirect_to(@zone, :notice => 'Zone was successfully created.') }
        format.xml  { render :xml => @zone, :status => :created, :location => @zone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zones/1
  # PUT /zones/1.xml
  def update
    @zone = Zone.find(params[:id])

    respond_to do |format|
      if @zone.update_attributes(params[:zone])
        format.html { redirect_to(@zone, :notice => 'Zone was successfully updated.') }
        format.js do
          render :update do |page|
            html = render(:partial=>"/zones/readonly_line_item", :locals=>{:zone=>@zone})
            page << "$('#zone_#{@zone.id.to_s}').html(#{html.to_json})"
          end
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @zone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zones/1
  # DELETE /zones/1.xml
  def destroy
    @zone = Zone.find(params[:id])
    @zone.destroy

    respond_to do |format|
      format.html { redirect_to(zones_url) }
      format.xml  { head :ok }
      format.js do
        render :update do |page|
          page << "$('#zone_#{params[:id]}_container').remove()"
        end
      end
    end
  end

  def add_technician
    zone = Zone.find_by_id(params[:zone_id], :include=>[:technicians,{:project=>:technicians}])
    technician = Technician.find_by_id(params[:technician_id])
    if zone && technician
      if !zone.project.technicians.collect{|t|t.id}.include?(technician.id)
        zone.project.technicians << technician
        zone.project.save
      end
      if !zone.technicians.collect{|t|t.id}.include?(technician.id)
        zone.technicians << technician
        zone.save
      end
      status = 200
    else
      status = 500
    end
    render :nothing=>true, :status=>status
  end

  def remove_technician
    zone = Zone.find_by_id(params[:zone_id], :include=>:technicians)
    technician = zone.technicians.detect{|t| t.id.to_s == params[:technician_id.to_s]}
    if zone && technician
      sql = "DELETE FROM `technicians_zones` WHERE (`technicians_zones`.`zone_id` = #{zone.id.to_s} and `technician_id` = #{technician.id.to_s})" 
      ActiveRecord::Base.connection.execute(sql)
      status = 200
    else
      status = 500
    end
    render :nothing=>true, :status=>status
  end
end
