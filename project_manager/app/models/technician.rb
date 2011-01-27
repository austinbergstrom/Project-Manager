class Technician < ActiveRecord::Base

  belongs_to :skill_level
  belongs_to :supervisor_level
  belongs_to :project_type
  has_and_belongs_to_many :projects
  belongs_to :restriction
  has_and_belongs_to_many :zones

  validates_presence_of :first_name
  validates_presence_of :last_name

  def name
    "#{last_name}, #{first_name} #{middle_initial}"
  end

  def abb
    "#{first_name[0,1]}#{last_name}"
  end
end
