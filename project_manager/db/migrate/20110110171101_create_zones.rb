class CreateZones < ActiveRecord::Migration
  def self.up
    create_table :zones do |t|
      t.string :name
      t.integer :responsibility_type_id
      t.integer :service_type_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :zones
  end
end
