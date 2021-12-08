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

ActiveRecord::Schema.define(version: 2020_04_26_235157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guards", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "number"
    t.text "password_digest"
    t.text "company"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.text "report_type"
    t.date "date"
    t.time "time"
    t.text "location"
    t.text "description"
    t.bigint "guard_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guard_id"], name: "index_reports_on_guard_id"
  end

end
