class HomeController < ApplicationController
  def index
  end

  def canvas
    
  end

  def slider_test
    
  end

  def json_feed
    @projects = Project.json_feed(params)
    respond_to do |format|
      format.json{ render :json=>@projects.to_json}
    end
  end

end
