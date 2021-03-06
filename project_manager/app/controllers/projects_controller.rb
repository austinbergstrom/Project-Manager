class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
      format.json { render :json=>@projects.to_json}
    end
  end

  #GET /projects/json_feed

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id], :include=>:technicians)
    @available_technicians = @project.available_technicians
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to("/projects/#{@project.id.to_s}/edit", :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end

  def remove_technician
    @project = Project.find(params[:project_id], :include=>:technicians)
    technician = Technician.find(params[:technician_id])
    @project.technicians.delete(technician)
    render :nothing=>true
  end

  def add_technician
    @project = Project.find(params[:project_id], :include=>:technicians)
    technician = Technician.find(params[:technician_id])
    @project.technicians << technician unless @project.technicians.include?(technician)
    render :nothing=>true
  end

  def event_drop
    project = Project.find_by_id(params[:id])
    if project
      project.update_from_drop(params)
      status = 200
    else
      status = 500
    end
    render :nothing=>true, :status=>status
  end

  def event_resize
    project = Project.find_by_id(params[:id])
    if project
      project.update_from_resize(params)
      status = 200
    else
      status = 500
    end
    render :nothing=>true, :status=>status
  end

end
