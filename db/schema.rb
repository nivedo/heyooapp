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

ActiveRecord::Schema.define(version: 20131217225132) do

  create_table "contents", force: true do |t|
    t.text     "description"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "message_id"
  end

  add_index "contents", ["ancestry"], name: "index_contents_on_ancestry"
  add_index "contents", ["message_id"], name: "index_contents_on_message_id"
  add_index "contents", ["user_id"], name: "index_contents_on_user_id"

  create_table "groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "content_id"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["content_id"], name: "index_images_on_content_id"

  create_table "messages", force: true do |t|
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["group_id"], name: "index_messages_on_group_id"

  create_table "usergroups", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usergroups", ["group_id"], name: "index_usergroups_on_group_id"
  add_index "usergroups", ["user_id"], name: "index_usergroups_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "unit_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
