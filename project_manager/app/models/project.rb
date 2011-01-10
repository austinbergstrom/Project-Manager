class Project < ActiveRecord::Base

  belongs_to :project_type

  validates_presence_of :name
  validates_presence_of :project_type_id
  validates_uniqueness_of :name

end
