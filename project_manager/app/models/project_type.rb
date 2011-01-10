class ProjectType < ActiveRecord::Base

  validates_uniqueness_of :description
  validates_presence_of :description

  def to_s
    description
  end
  
  def abbreviation
    description[0,1]
  end
end
