class Zone < ActiveRecord::Base

  belongs_to :project
  belongs_to :zone_level
  has_and_belongs_to_many :technicians

  def zone_name
    name.blank? ? "(Not Provided)" : name
  end

end
