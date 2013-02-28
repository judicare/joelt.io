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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130115185117) do

  create_table "entries", force: true do |t|
    t.string   "title",                               null: false
    t.text     "content",                             null: false
    t.string   "entry_type",         default: "blog", null: false
    t.string   "slug",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.boolean  "published",          default: false,  null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "image_meta"
  end

  create_table "entries_tags", id: false, force: true do |t|
    t.integer "entry_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.string   "slug",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
