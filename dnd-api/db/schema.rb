# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_12_163330) do

  create_table "characterclass_equipments", force: :cascade do |t|
    t.integer "equipment_id", null: false
    t.integer "characterclass_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["characterclass_id"], name: "index_characterclass_equipments_on_characterclass_id"
    t.index ["equipment_id"], name: "index_characterclass_equipments_on_equipment_id"
  end

  create_table "characterclass_proficiencies", force: :cascade do |t|
    t.integer "proficiency_id", null: false
    t.integer "characterclass_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["characterclass_id"], name: "index_characterclass_proficiencies_on_characterclass_id"
    t.index ["proficiency_id"], name: "index_characterclass_proficiencies_on_proficiency_id"
  end

  create_table "characterclasses", force: :cascade do |t|
    t.string "name"
    t.integer "hit_die"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_url"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "characterclass_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "race_id"
    t.index ["characterclass_id"], name: "index_characters_on_characterclass_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "speed"
    t.string "age"
    t.string "alignment"
    t.string "size_description"
    t.string "language_desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_url"
  end

  add_foreign_key "characterclass_equipments", "characterclasses"
  add_foreign_key "characterclass_equipments", "equipment"
  add_foreign_key "characterclass_proficiencies", "characterclasses"
  add_foreign_key "characterclass_proficiencies", "proficiencies"
  add_foreign_key "characters", "characterclasses"
  add_foreign_key "characters", "races"
end
