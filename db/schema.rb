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

ActiveRecord::Schema.define(version: 2020_06_05_184253) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "password_digest", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "hurigana"
    t.string "phone"
    t.integer "zipcode"
    t.string "street_address"
    t.string "relationship"
    t.text "information"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_groups_on_company_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "focus"
    t.text "content"
    t.datetime "datetime", default: -> { "CURRENT_TIMESTAMP" }
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "recorder_id"
    t.index ["recorder_id"], name: "index_posts_on_recorder_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "recorders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.string "login_id", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_recorders_on_company_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "hurigana"
    t.string "password_digest", null: false
    t.bigint "company_id"
    t.integer "gender"
    t.date "birthday"
    t.integer "zipcode"
    t.string "street_address"
    t.integer "care_required"
    t.integer "status"
    t.date "occupancy"
    t.integer "room_number"
    t.string "login_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "families", "users"
  add_foreign_key "groups", "companies"
  add_foreign_key "posts", "recorders"
  add_foreign_key "posts", "users"
  add_foreign_key "recorders", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "groups"
end
