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

ActiveRecord::Schema.define(:version => 20110419232451) do

  create_table "bot_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bots", :force => true do |t|
    t.string   "name"
    t.integer  "teams_id"
    t.integer  "heats_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heats", :force => true do |t|
    t.integer  "bot_types_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "laps", :force => true do |t|
    t.integer  "bots_id"
    t.integer  "heats_id"
    t.time     "lap_time"
    t.integer  "corners_completed"
    t.boolean  "disqualified"
    t.boolean  "bonus_landbox"
    t.boolean  "bonus_takeoff"
    t.boolean  "bonus_ring"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "bonus_landlot"
  end

  create_table "team_members", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "teams_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "views", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_type"
    t.integer  "display_type_id"
  end

end
