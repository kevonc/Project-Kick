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

ActiveRecord::Schema.define(:version => 20130809173606) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "total_projects",                 :default => 0
    t.integer  "total_funding",                  :default => 0
    t.string   "main_category"
    t.text     "project_overfunded_percentages"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "total_projects", :default => 0
    t.integer  "total_funding",  :default => 0
    t.float    "latitude",       :default => 0.0
    t.float    "longitude",      :default => 0.0
  end

  create_table "d3_category_fundings", :force => true do |t|
    t.integer "x"
    t.integer "y"
    t.string  "color"
    t.string  "cat_name"
    t.hstore  "sub_cat"
    t.string  "total_funding"
  end

  add_index "d3_category_fundings", ["sub_cat"], :name => "index_d3_category_fundings_on_sub_cat"

  create_table "d3_category_projects", :force => true do |t|
    t.integer "x"
    t.integer "y"
    t.string  "color"
    t.string  "cat_name"
    t.hstore  "sub_cat"
    t.integer "total_projects"
  end

  add_index "d3_category_projects", ["sub_cat"], :name => "index_d3_category_projects_on_sub_cat"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.integer  "backers"
    t.integer  "funding"
    t.integer  "goal"
    t.integer  "city_id"
    t.integer  "category_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.boolean  "expired"
    t.integer  "overfunded",  :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
