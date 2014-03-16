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

ActiveRecord::Schema.define(version: 20140314214051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
    t.string   "region"
    t.string   "currency"
  end

  create_table "indicators", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", force: true do |t|
    t.integer  "country_id"
    t.integer  "indicator_id"
    t.float    "value"
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "years", ["country_id"], name: "index_years_on_country_id", using: :btree
  add_index "years", ["indicator_id"], name: "index_years_on_indicator_id", using: :btree

end
