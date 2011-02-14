class Project < ActiveRecord::Base

  belongs_to :project_type
  belongs_to :project_color
  has_and_belongs_to_many :technicians
  has_and_belongs_to_many :project_scopes
  has_many :zones

  validates_presence_of :name
  validates_presence_of :project_type_id
  validates_uniqueness_of :name

  def self.json_feed(params)
    start_date = format_time Time.at(params[:start].to_i)
    end_date = format_time Time.at(params[:end].to_i)

    projects = Project.all(:conditions=>["start_date BETWEEN ? AND ?", start_date, end_date], :include=>:project_color)

    json_projects = []

    for project in projects
      if project.project_color
        bg_color = project.project_color.background
        color = project.project_color.text
      else
        bg_color = "black"
        color = "white"
      end
      json_projects << {:start=>project.start_date.to_i, :end=>project.end_date.to_i, :allDay=>false,
                        :id=>"project_#{project.id.to_s}",:title=>project.name, :url=>"/projects/#{project.id.to_s}/edit",
                        :editable=>true, :source=>'', :technicians=>project.technician_list, :background_color=>bg_color, :color=>color}
    end
    return json_projects
  end

  def technician_list
    technicians.collect{|t| t.name}.join(' | ')
  end

  def self.format_time(time)
    return time.strftime("%Y-%m-%d")
  end

  def available_technicians
    if !technician_ids.empty?
      return Technician.all(:conditions=>["id NOT IN (?)", technician_ids])
    else
      return Technician.all
    end
  end

  def background_color
    if project_color
      return project_color.background
    end
    return "lightgray"
  end

  def text_color
    if project_color
      return project_color.text
    end
    return "black"
  end

  def update_from_drop(params)
    delta = params[:day_delta].to_i
    update_attributes(:start_date=>start_date+delta.days,
                      :end_date=>end_date+delta.days)
  end

  def update_from_resize(params)
    delta = params[:day_delta].to_i
    update_attribute(:end_date, end_date+delta.days)
  end
  
end
