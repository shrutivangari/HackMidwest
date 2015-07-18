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

ActiveRecord::Schema.define(version: 20150718222957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diseases", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "food_nutrients", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "food_id"
    t.integer  "nutrient_id"
    t.integer  "value"
    t.string   "unit"
  end

  add_index "food_nutrients", ["food_id"], name: "index_food_nutrients_on_food_id", using: :btree
  add_index "food_nutrients", ["nutrient_id"], name: "index_food_nutrients_on_nutrient_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "nutrients", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recommended_ranges", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "disease_id"
    t.integer  "nutrient_id"
    t.integer  "value"
    t.string   "units"
  end

  add_index "recommended_ranges", ["disease_id"], name: "index_recommended_ranges_on_disease_id", using: :btree
  add_index "recommended_ranges", ["nutrient_id"], name: "index_recommended_ranges_on_nutrient_id", using: :btree

  create_table "user_diseases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "disease_id"
  end

  add_index "user_diseases", ["disease_id"], name: "index_user_diseases_on_disease_id", using: :btree
  add_index "user_diseases", ["user_id"], name: "index_user_diseases_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.integer  "gender"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "food_nutrients", "foods"
  add_foreign_key "food_nutrients", "nutrients"
  add_foreign_key "recommended_ranges", "diseases"
  add_foreign_key "recommended_ranges", "nutrients"
  add_foreign_key "user_diseases", "diseases"
  add_foreign_key "user_diseases", "users"
end
