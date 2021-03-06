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

ActiveRecord::Schema.define(:version => 20121101222223) do

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "assets", :force => true do |t|
    t.integer  "poster_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "dimensions", :force => true do |t|
    t.string  "text"
    t.boolean "status"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_types", :force => true do |t|
    t.string   "description",                :null => false
    t.integer  "priority",    :default => 0, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",              :null => false
    t.string   "abbreviation"
    t.string   "website"
    t.text     "short_description"
    t.text     "long_description"
    t.integer  "group_type_id",     :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "members", :primary_key => "medlem_id", :force => true do |t|
    t.string "fornavn"
    t.string "etternavn"
    t.string "mail"
    t.string "telefon"
    t.string "passord"
  end

  create_table "members_roles", :force => true do |t|
    t.integer "member_id"
    t.integer "role_id"
  end

  create_table "posters", :force => true do |t|
    t.string   "name"
    t.text     "poster_text"
    t.text     "description"
    t.boolean  "flyers"
    t.boolean  "banner"
    t.string   "status",         :limit => 20
    t.datetime "send_to_press"
    t.datetime "event_time"
    t.integer  "dimension_id"
    t.integer  "group_id"
    t.integer  "event_id"
    t.integer  "area_id"
    t.integer  "responsible_id"
    t.integer  "orderer_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.boolean  "show_in_hierarchy", :default => false
    t.integer  "role_id"
    t.integer  "group_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

end
