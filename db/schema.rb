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

ActiveRecord::Schema.define(version: 20140314150624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriers", force: true do |t|
    t.string   "carrier_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delays", force: true do |t|
    t.integer  "day_of_week"
    t.integer  "carrier_id"
    t.integer  "arrival_delay"
    t.integer  "departure_delay"
    t.integer  "year"
    t.string   "origin_code"
    t.string   "destination_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delays", ["carrier_id"], name: "index_delays_on_carrier_id", using: :btree

end
