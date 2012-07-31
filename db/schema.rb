# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120727182341) do

  create_table "cases", :force => true do |t|
    t.string   "name",         :limit => 150,                   :null => false
    t.boolean  "active",                      :default => true
    t.string   "filter",       :limit => 3
    t.integer  "project_id"
    t.integer  "lock_version",                :default => 0,    :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "matrices", :force => true do |t|
    t.integer  "case_id"
    t.integer  "tabela_id"
    t.string   "crud",         :limit => 4
    t.integer  "lock_version",              :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name",         :limit => 100,                   :null => false
    t.boolean  "active",                      :default => true
    t.string   "filter",       :limit => 3
    t.integer  "lock_version",                :default => 0,    :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rails_admin_histories", ["item", "table"], :name => "index_histories_on_item_and_table"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tabelas", :force => true do |t|
    t.string   "name",         :limit => 150,                   :null => false
    t.boolean  "active",                      :default => true
    t.string   "filter",       :limit => 3
    t.integer  "project_id"
    t.integer  "lock_version",                :default => 0,    :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "password_salt"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "roles"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
