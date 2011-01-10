class SupervisorLevel < ActiveRecord::Base
  validates_uniqueness_of :level
  validates_presence_of :level

  def to_s
    level
  end
end
