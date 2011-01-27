class RestrictionsController < ApplicationController
  # GET /restrictions
  # GET /restrictions.xml
  def index
    @restrictions = Restriction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restrictions }
    end
  end

  # GET /restrictions/1
  # GET /restrictions/1.xml
  def show
    @restriction = Restriction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @restriction }
    end
  end

  # GET /restrictions/new
  # GET /restrictions/new.xml
  def new
    @restriction = Restriction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @restriction }
    end
  end

  # GET /restrictions/1/edit
  def edit
    @restriction = Restriction.find(params[:id])
  end

  # POST /restrictions
  # POST /restrictions.xml
  def create
    @restriction = Restriction.new(params[:restriction])

    respond_to do |format|
      if @restriction.save
        format.html { redirect_to(@restriction, :notice => 'Restriction was successfully created.') }
        format.xml  { render :xml => @restriction, :status => :created, :location => @restriction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /restrictions/1
  # PUT /restrictions/1.xml
  def update
    @restriction = Restriction.find(params[:id])

    respond_to do |format|
      if @restriction.update_attributes(params[:restriction])
        format.html { redirect_to(@restriction, :notice => 'Restriction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /restrictions/1
  # DELETE /restrictions/1.xml
  def destroy
    @restriction = Restriction.find(params[:id])
    @restriction.destroy

    respond_to do |format|
      format.html { redirect_to(restrictions_url) }
      format.xml  { head :ok }
    end
  end
end
