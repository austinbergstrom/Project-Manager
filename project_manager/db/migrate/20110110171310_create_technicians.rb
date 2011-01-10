class CreateTechnicians < ActiveRecord::Migration
  def self.up
    create_table :technicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.integer :project_type_id
      t.integer :skill_level_id
      t.integer :supervisor_level_id
      t.text :compatability_notes
      t.text :travel_notes
      t.text :work_capability_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :technicians
  end
end
