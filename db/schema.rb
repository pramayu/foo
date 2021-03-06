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

ActiveRecord::Schema.define(version: 20160921030609) do

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.datetime "event_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "source",     limit: 255
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "galleries", ["event_id"], name: "index_galleries_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 50
    t.string   "email",           limit: 50
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "remember_digest", limit: 255
    t.string   "reset_digest",    limit: 255
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "events", "users"
  add_foreign_key "galleries", "events"
end
