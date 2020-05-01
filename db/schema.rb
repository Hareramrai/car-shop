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

ActiveRecord::Schema.define(version: 2020_05_01_084201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_colors", force: :cascade do |t|
    t.string "interior"
    t.string "exterior"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model_features", force: :cascade do |t|
    t.string "manufacturer"
    t.string "model"
    t.string "series"
    t.integer "body_type"
    t.string "cylinders"
    t.string "displacement"
    t.bigint "body_color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_color_id"], name: "index_model_features_on_body_color_id"
    t.index ["body_type"], name: "index_model_features_on_body_type"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vin"
    t.float "grade"
    t.integer "stock"
    t.decimal "price", precision: 10, scale: 2
    t.integer "year"
    t.integer "mileage"
    t.bigint "model_feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mileage"], name: "index_vehicles_on_mileage"
    t.index ["model_feature_id"], name: "index_vehicles_on_model_feature_id"
    t.index ["price"], name: "index_vehicles_on_price"
    t.index ["year"], name: "index_vehicles_on_year"
  end

  add_foreign_key "model_features", "body_colors"
  add_foreign_key "vehicles", "model_features"
end
