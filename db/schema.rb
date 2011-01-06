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

ActiveRecord::Schema.define(:version => 20110104002445) do

  create_table "doctor_specialties", :id => false, :force => true do |t|
    t.integer "servant_id"
    t.integer "specialty_id"
    t.integer "number"
  end

  add_index "doctor_specialties", ["number"], :name => "index_doctor_specialties_on_number"
  add_index "doctor_specialties", ["servant_id"], :name => "index_doctor_specialties_on_servant_id"
  add_index "doctor_specialties", ["specialty_id"], :name => "index_doctor_specialties_on_specialty_id"

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.date     "birth"
    t.string   "sex"
    t.string   "cpf"
    t.integer  "state_id"
    t.string   "email"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "zip_code"
    t.string   "district"
    t.string   "city"
    t.string   "area_code"
    t.string   "telephone"
    t.string   "mobile"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "controller"
    t.string   "action"
    t.boolean  "enabled",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["action"], :name => "index_permissions_on_action"
  add_index "permissions", ["controller"], :name => "index_permissions_on_controller"
  add_index "permissions", ["enabled"], :name => "index_permissions_on_enabled"
  add_index "permissions", ["name"], :name => "index_permissions_on_name"

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "permission_id"
  end

  add_index "permissions_roles", ["permission_id"], :name => "index_permissions_roles_on_permission_id"
  add_index "permissions_roles", ["role_id"], :name => "index_permissions_roles_on_role_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "enabled",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["enabled"], :name => "index_roles_on_enabled"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "servants", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.date     "birth"
    t.string   "sex"
    t.string   "cpf"
    t.integer  "state_id"
    t.string   "email"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "zip_code"
    t.string   "district"
    t.string   "city"
    t.string   "area_code"
    t.string   "telephone"
    t.string   "mobile"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crm"
  end

  add_index "servants", ["crm"], :name => "index_servants_on_crm"
  add_index "servants", ["enabled"], :name => "index_servants_on_enabled"
  add_index "servants", ["state_id"], :name => "index_servants_on_state_id"
  add_index "servants", ["type"], :name => "index_servants_on_type"

  create_table "specialties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "enabled",                             :default => false
    t.boolean  "can_login",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
