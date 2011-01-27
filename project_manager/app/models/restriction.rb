class Restriction < ActiveRecord::Base

  has_many :technicians

  validates_presence_of :number
  validates_presence_of :description

  def value
    [number, description].join(': ')
  end

end
