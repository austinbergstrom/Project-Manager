class ZoneLevel < ActiveRecord::Base

  has_many :zones

  def to_s
    level
  end

end
