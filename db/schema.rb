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

ActiveRecord::Schema.define(version: 2019_04_24_031509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.datetime "last_visit"
    t.bigint "office_id"
    t.bigint "patient_id"
    t.bigint "user_id"
    t.integer "appointment_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_appointments_on_office_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.integer "phone_number"
    t.string "hours"
    t.bigint "user_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_offices_on_patient_id"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.datetime "last_visit"
    t.integer "office_id"
    t.integer "appointment_id"
    t.integer "scan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scans", force: :cascade do |t|
    t.string "result"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patients_id"
    t.index ["patients_id"], name: "index_scans_on_patients_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.integer "status"
    t.string "confirmation_code"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  add_foreign_key "appointments", "offices"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "users"
  add_foreign_key "offices", "patients"
  add_foreign_key "offices", "users"
  add_foreign_key "scans", "patients", column: "patients_id"
end
