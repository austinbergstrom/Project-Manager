class ZonesController < ApplicationController
  # GET /zones
  # GET /zones.xml
  def index
    @zones = Zone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @zones }
    end
  end

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

  # GET /zones/1
  # GET /zones/1.xml
  def show
    @zone = Zone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @zone }
    end
  end

  # GET /zones/new
  # GET /zones/new.xml
  def new
    @zone = Zone.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zone }
    end
  end

  # GET /zones/1/edit
  def edit
    @zone = Zone.find(params[:id])
    respond_to do |f|
      f.html
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
end
