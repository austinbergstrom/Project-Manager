class TravelRestrictionsController < ApplicationController
  # GET /travel_restrictions
  # GET /travel_restrictions.xml
  def index
    @travel_restrictions = TravelRestriction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @travel_restrictions }
    end
  end

  # GET /travel_restrictions/1
  # GET /travel_restrictions/1.xml
  def show
    @travel_restriction = TravelRestriction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @travel_restriction }
    end
  end

  # GET /travel_restrictions/new
  # GET /travel_restrictions/new.xml
  def new
    @travel_restriction = TravelRestriction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @travel_restriction }
    end
  end

  # GET /travel_restrictions/1/edit
  def edit
    @travel_restriction = TravelRestriction.find(params[:id])
  end

  # POST /travel_restrictions
  # POST /travel_restrictions.xml
  def create
    @travel_restriction = TravelRestriction.new(params[:travel_restriction])

    respond_to do |format|
      if @travel_restriction.save
        format.html { redirect_to(@travel_restriction, :notice => 'Travel restriction was successfully created.') }
        format.xml  { render :xml => @travel_restriction, :status => :created, :location => @travel_restriction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @travel_restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /travel_restrictions/1
  # PUT /travel_restrictions/1.xml
  def update
    @travel_restriction = TravelRestriction.find(params[:id])

    respond_to do |format|
      if @travel_restriction.update_attributes(params[:travel_restriction])
        format.html { redirect_to(@travel_restriction, :notice => 'Travel restriction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @travel_restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_restrictions/1
  # DELETE /travel_restrictions/1.xml
  def destroy
    @travel_restriction = TravelRestriction.find(params[:id])
    @travel_restriction.destroy

    respond_to do |format|
      format.html { redirect_to(travel_restrictions_url) }
      format.xml  { head :ok }
    end
  end
end
