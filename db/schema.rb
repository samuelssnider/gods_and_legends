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

ActiveRecord::Schema.define(version: 20180630182036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "births", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
  end

  create_table "deities", force: :cascade do |t|
    t.string "name"
    t.integer "tier"
    t.text "description"
    t.string "classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender"
    t.bigint "mythology_id"
    t.string "image"
    t.index ["mythology_id"], name: "index_deities_on_mythology_id"
  end

  create_table "deity_domains", force: :cascade do |t|
    t.bigint "deity_id"
    t.bigint "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deity_id"], name: "index_deity_domains_on_deity_id"
    t.index ["domain_id"], name: "index_deity_domains_on_domain_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "event_actors", force: :cascade do |t|
    t.bigint "deity_id"
    t.bigint "event_id"
    t.index ["deity_id"], name: "index_event_actors_on_deity_id"
    t.index ["event_id"], name: "index_event_actors_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mythology_id"
    t.index ["mythology_id"], name: "index_events_on_mythology_id"
  end

  create_table "mythologies", force: :cascade do |t|
    t.string "name"
    t.text "origin_story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "deities", "mythologies"
  add_foreign_key "deity_domains", "deities"
  add_foreign_key "deity_domains", "domains"
  add_foreign_key "event_actors", "deities"
  add_foreign_key "event_actors", "events"
  add_foreign_key "events", "mythologies"
end
