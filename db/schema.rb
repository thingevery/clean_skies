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

ActiveRecord::Schema.define(:version => 20121013053829) do

  create_table "albums", :force => true do |t|
    t.string   "album_name"
    t.text     "album_description"
    t.date     "date_created"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "photo_description"
    t.date     "date_taken"
    t.integer  "album_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "nickname"
    t.string   "email"
    t.string   "profile_pic"
    t.date     "date_of_birth"
    t.text     "description"
    t.string   "location"
    t.date     "date_joined"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
