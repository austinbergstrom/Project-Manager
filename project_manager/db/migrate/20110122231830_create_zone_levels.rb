class CreateZoneLevels < ActiveRecord::Migration
  def self.up
    create_table :zone_levels do |t|
      t.string :level

      t.timestamps
    end
  end

  def self.down
    drop_table :zone_levels
  end
end
