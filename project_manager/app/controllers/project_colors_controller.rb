class ProjectColorsController < ApplicationController
  # GET /project_colors
  # GET /project_colors.xml
  def index
    @project_colors = ProjectColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_colors }
    end
  end

  # GET /project_colors/1
  # GET /project_colors/1.xml
  def show
    @project_color = ProjectColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_color }
    end
  end

  # GET /project_colors/new
  # GET /project_colors/new.xml
  def new
    @project_color = ProjectColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_color }
    end
  end

  # GET /project_colors/1/edit
  def edit
    @project_color = ProjectColor.find(params[:id])
  end

  # POST /project_colors
  # POST /project_colors.xml
  def create
    @project_color = ProjectColor.new(params[:project_color])

    respond_to do |format|
      if @project_color.save
        format.html { redirect_to(@project_color, :notice => 'Project color was successfully created.') }
        format.xml  { render :xml => @project_color, :status => :created, :location => @project_color }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_color.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_colors/1
  # PUT /project_colors/1.xml
  def update
    @project_color = ProjectColor.find(params[:id])

    respond_to do |format|
      if @project_color.update_attributes(params[:project_color])
        format.html { redirect_to(@project_color, :notice => 'Project color was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_color.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_colors/1
  # DELETE /project_colors/1.xml
  def destroy
    @project_color = ProjectColor.find(params[:id])
    @project_color.destroy

    respond_to do |format|
      format.html { redirect_to(project_colors_url) }
      format.xml  { head :ok }
    end
  end
end
