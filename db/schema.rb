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

ActiveRecord::Schema.define(version: 20150203202442) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "addressable_id"
    t.string   "addressable_type"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"

  create_table "case_symptoms", force: :cascade do |t|
    t.integer "case_id"
    t.integer "symptom_id"
  end

  add_index "case_symptoms", ["case_id"], name: "index_case_symptoms_on_case_id"
  add_index "case_symptoms", ["symptom_id"], name: "index_case_symptoms_on_symptom_id"

  create_table "cases", force: :cascade do |t|
    t.text     "description"
    t.integer  "patient_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "workflow_state"
  end

  add_index "cases", ["patient_id"], name: "index_cases_on_patient_id"

  create_table "names", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "nameable_id"
    t.string   "nameable_type"
  end

  add_index "names", ["nameable_type", "nameable_id"], name: "index_names_on_nameable_type_and_nameable_id"

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "patients", force: :cascade do |t|
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
