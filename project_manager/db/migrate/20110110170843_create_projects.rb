class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :project_type_id
      t.datetime :start_date
      t.datetime :end_date
      t.text :notes
      t.integer :technicians_needed
      t.string :district_field_manager
      t.string :project_manager
      t.boolean :purchase_order
      t.boolean :solid
      t.integer :project_color_id

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
