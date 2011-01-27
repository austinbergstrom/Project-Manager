class CreateProjectScopesProjects < ActiveRecord::Migration
  def self.up
    create_table :project_scopes_projects, {:id=>false} do |t|
      t.integer :project_id
      t.integer :project_scope_id
    end
  end

  def self.down
  end
end
