class Technician < ActiveRecord::Base

  belongs_to :skill_level
  belongs_to :supervisor_level
  belongs_to :project_type

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :skill_level_id

  def name
    "#{last_name}, #{first_name} #{middle_initial}"
  end
end
