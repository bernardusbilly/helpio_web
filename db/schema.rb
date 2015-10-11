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

ActiveRecord::Schema.define(version: 20151010110542) do

  create_table "comment_likes", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "uid"
    t.integer  "like_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
  end

  create_table "pin_likes", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade do |t|
    t.integer  "uid"
    t.string   "title"
    t.float    "lon"
    t.float    "lat"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "uid"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "nickname"
    t.date     "birthday"
    t.integer  "gender"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end