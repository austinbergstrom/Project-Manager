class CreateProjectColors < ActiveRecord::Migration
  def self.up
    create_table :project_colors do |t|
      t.string :background
      t.string :text
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :project_colors
  end
end
