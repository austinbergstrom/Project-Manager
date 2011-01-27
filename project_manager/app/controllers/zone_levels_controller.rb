class ZoneLevelsController < ApplicationController
  # GET /zone_levels
  # GET /zone_levels.xml
  def index
    @zone_levels = ZoneLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @zone_levels }
    end
  end

  # GET /zone_levels/1
  # GET /zone_levels/1.xml
  def show
    @zone_level = ZoneLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @zone_level }
    end
  end

  # GET /zone_levels/new
  # GET /zone_levels/new.xml
  def new
    @zone_level = ZoneLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zone_level }
    end
  end

  # GET /zone_levels/1/edit
  def edit
    @zone_level = ZoneLevel.find(params[:id])
  end

  # POST /zone_levels
  # POST /zone_levels.xml
  def create
    @zone_level = ZoneLevel.new(params[:zone_level])

    respond_to do |format|
      if @zone_level.save
        format.html { redirect_to(@zone_level, :notice => 'Zone level was successfully created.') }
        format.xml  { render :xml => @zone_level, :status => :created, :location => @zone_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zone_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zone_levels/1
  # PUT /zone_levels/1.xml
  def update
    @zone_level = ZoneLevel.find(params[:id])

    respond_to do |format|
      if @zone_level.update_attributes(params[:zone_level])
        format.html { redirect_to(@zone_level, :notice => 'Zone level was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @zone_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zone_levels/1
  # DELETE /zone_levels/1.xml
  def destroy
    @zone_level = ZoneLevel.find(params[:id])
    @zone_level.destroy

    respond_to do |format|
      format.html { redirect_to(zone_levels_url) }
      format.xml  { head :ok }
    end
  end
end
