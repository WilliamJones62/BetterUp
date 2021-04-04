# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_01_224124) do

  create_table "coach_appointments", force: :cascade do |t|
    t.string "name"
    t.string "day_of_week"
    t.string "client"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gmt_hour"
    t.integer "gmt_min"
  end

  create_table "coaches_csvs", force: :cascade do |t|
    t.string "name"
    t.string "timezone"
    t.string "day_of_week"
    t.string "available_at"
    t.string "available_until"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
