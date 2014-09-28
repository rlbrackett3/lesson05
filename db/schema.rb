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

ActiveRecord::Schema.define(version: 20140923181749) do

  create_table "addresses", force: true do |t|
    t.integer "number"
    t.string  "street"
    t.string  "city"
    t.integer "user_id"
  end

  create_table "addresses_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "address_id", null: false
  end

  add_index "addresses_users", ["address_id", "user_id"], name: "index_addresses_users_on_address_id_and_user_id"
  add_index "addresses_users", ["user_id", "address_id"], name: "index_addresses_users_on_user_id_and_address_id"

  create_table "posts", force: true do |t|
    t.string  "title"
    t.string  "text"
    t.integer "user_id"
  end

  create_table "user_addresses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "fullname"
    t.string  "email"
    t.integer "address_id"
    t.integer "post_id"
  end

end
