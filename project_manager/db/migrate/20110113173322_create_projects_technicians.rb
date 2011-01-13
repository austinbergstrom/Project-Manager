class CreateProjectsTechnicians < ActiveRecord::Migration
  def self.up
    create_table :projects_technicians, {:id=>false} do |t|
      t.integer :project_id
      t.integer :technician_id
    end
  end

  def self.down
  end
end
