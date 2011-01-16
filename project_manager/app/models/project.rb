class Project < ActiveRecord::Base

  belongs_to :project_type
  has_and_belongs_to_many :technicians

  validates_presence_of :name
  validates_presence_of :project_type_id
  validates_uniqueness_of :name

  def self.json_feed(params)
    start_date = format_time Time.at(params[:start].to_i)
    end_date = format_time Time.at(params[:end].to_i)

    projects = Project.all(:conditions=>["start_date BETWEEN ? AND ?", start_date, end_date])

    json_projects = []

    class_names = ["fc-event1", "fc-event2", "fc-event3"]
    index = -1

    for project in projects
      index += 1
      if index > class_names.length
        index = 0
      end
      puts class_names[index]
      json_projects << {:start=>project.start_date.to_i, :end=>project.end_date.to_i, :allDay=>false,
                        :id=>"project_#{project.id.to_s}",:title=>project.name, :url=>"/projects/#{project.id.to_s}/edit",
                        :className=>"#{class_names[index]}", :editable=>true, :source=>'',
                        :technicians=>project.technician_list}
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
end
