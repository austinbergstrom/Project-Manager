class CreateTechnicians < ActiveRecord::Migration
  def self.up
    create_table :technicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :email
      t.string :phone_one
      t.string :phone_two
      t.integer :project_type_id
      t.integer :skill_level_id
      t.integer :supervisor_level_id
      t.text :compatability_notes
      t.text :travel_notes
      t.text :work_capability_notes
      t.integer :restriction_id
      t.integer :travel_restriction_id
      t.integer :jobs_completed
      t.boolean :valve_experience
      t.boolean :lp_experience
      t.boolean :hp_experience
      t.boolean :generator_experience
      t.boolean :rotor_experience
      t.boolean :rewind_experience
      t.boolean :mat_experience
      t.boolean :bwr_experience
      t.boolean :rca_experience
      
      t.timestamps
    end
  end

  def self.down
    drop_table :technicians
  end
end
