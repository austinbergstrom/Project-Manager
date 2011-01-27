class CreateTravelRestrictions < ActiveRecord::Migration
  def self.up
    create_table :travel_restrictions do |t|
      t.string :number
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :travel_restrictions
  end
end
