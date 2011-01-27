class CreateTechniciansZones < ActiveRecord::Migration
  def self.up
    create_table :technicians_zones, {:id=>false} do |t|
      t.integer :technician_id
      t.integer :zone_id
    end
  end

  def self.down
  end
end
