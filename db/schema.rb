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

ActiveRecord::Schema.define(:version => 20121018201930) do

  create_table "dimensions", :force => true do |t|
    t.string "text"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups_members", :id => false, :force => true do |t|
    t.integer "member_id"
    t.integer "group_id"
  end

  create_table "members", :primary_key => "medlem_id", :force => true do |t|
    t.string "firstname"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "password"
  end

  create_table "posters", :force => true do |t|
    t.string   "name"
    t.text     "poster_text"
    t.text     "description"
    t.text     "specification"
    t.boolean  "flyers"
    t.boolean  "banner"
    t.string   "status",         :limit => 20
    t.datetime "send_to_press"
    t.integer  "dimension_id"
    t.integer  "group_id"
    t.integer  "responsible_id"
    t.integer  "orderer_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
