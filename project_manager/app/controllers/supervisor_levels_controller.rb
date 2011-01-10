class SupervisorLevelsController < ApplicationController
  # GET /supervisor_levels
  # GET /supervisor_levels.xml
  def index
    @supervisor_levels = SupervisorLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supervisor_levels }
    end
  end

  # GET /supervisor_levels/1
  # GET /supervisor_levels/1.xml
  def show
    @supervisor_level = SupervisorLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supervisor_level }
    end
  end

  # GET /supervisor_levels/new
  # GET /supervisor_levels/new.xml
  def new
    @supervisor_level = SupervisorLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supervisor_level }
    end
  end

  # GET /supervisor_levels/1/edit
  def edit
    @supervisor_level = SupervisorLevel.find(params[:id])
  end

  # POST /supervisor_levels
  # POST /supervisor_levels.xml
  def create
    @supervisor_level = SupervisorLevel.new(params[:supervisor_level])

    respond_to do |format|
      if @supervisor_level.save
        format.html { redirect_to(@supervisor_level, :notice => 'Supervisor level was successfully created.') }
        format.xml  { render :xml => @supervisor_level, :status => :created, :location => @supervisor_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supervisor_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supervisor_levels/1
  # PUT /supervisor_levels/1.xml
  def update
    @supervisor_level = SupervisorLevel.find(params[:id])

    respond_to do |format|
      if @supervisor_level.update_attributes(params[:supervisor_level])
        format.html { redirect_to(@supervisor_level, :notice => 'Supervisor level was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supervisor_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisor_levels/1
  # DELETE /supervisor_levels/1.xml
  def destroy
    @supervisor_level = SupervisorLevel.find(params[:id])
    @supervisor_level.destroy

    respond_to do |format|
      format.html { redirect_to(supervisor_levels_url) }
      format.xml  { head :ok }
    end
  end
end
