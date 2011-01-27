# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110123021638) do

  create_table "machines", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines_zones", :id => false, :force => true do |t|
    t.integer "machine_id"
    t.integer "zone_id"
  end

  create_table "project_colors", :force => true do |t|
    t.string   "background"
    t.string   "text"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_scopes", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_scopes_projects", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "project_scope_id"
  end

  create_table "project_types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "project_type_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "notes"
    t.integer  "technicians_needed"
    t.string   "district_field_manager"
    t.string   "project_manager"
    t.boolean  "purchase_order"
    t.boolean  "solid"
    t.integer  "project_color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_technicians", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "technician_id"
  end

  create_table "restrictions", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_levels", :force => true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supervisor_levels", :force => true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technicians", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.string   "email"
    t.string   "phone_one"
    t.string   "phone_two"
    t.integer  "project_type_id"
    t.integer  "skill_level_id"
    t.integer  "supervisor_level_id"
    t.text     "compatability_notes"
    t.text     "travel_notes"
    t.text     "work_capability_notes"
    t.integer  "restriction_id"
    t.integer  "travel_restriction_id"
    t.integer  "jobs_completed"
    t.boolean  "valve_experience"
    t.boolean  "lp_experience"
    t.boolean  "hp_experience"
    t.boolean  "generator_experience"
    t.boolean  "rotor_experience"
    t.boolean  "rewind_experience"
    t.boolean  "mat_experience"
    t.boolean  "bwr_experience"
    t.boolean  "rca_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technicians_zones", :id => false, :force => true do |t|
    t.integer "technician_id"
    t.integer "zone_id"
  end

  create_table "travel_restrictions", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zone_levels", :force => true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zones", :force => true do |t|
    t.string   "name"
    t.integer  "responsibility_type_id"
    t.integer  "service_type_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "zone_level_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
