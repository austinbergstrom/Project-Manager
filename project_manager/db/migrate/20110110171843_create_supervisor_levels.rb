class CreateSupervisorLevels < ActiveRecord::Migration
  def self.up
    create_table :supervisor_levels do |t|
      t.string :level

      t.timestamps
    end
  end

  def self.down
    drop_table :supervisor_levels
  end
end
