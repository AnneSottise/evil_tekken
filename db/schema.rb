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

ActiveRecord::Schema.define(version: 2023_02_19_163013) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "life"
    t.integer "attack"
    t.integer "defense"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fighters", force: :cascade do |t|
    t.integer "character_id"
    t.integer "fight_id"
    t.integer "weapon_id"
    t.integer "experience_won"
    t.boolean "victory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_fighters_on_character_id"
    t.index ["fight_id"], name: "index_fighters_on_fight_id"
    t.index ["weapon_id"], name: "index_fighters_on_weapon_id"
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "fight_id"
    t.integer "attacker_id"
    t.integer "defenser_id"
    t.integer "position"
    t.decimal "damage"
    t.decimal "defenser_life"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attacker_id"], name: "index_rounds_on_attacker_id"
    t.index ["defenser_id"], name: "index_rounds_on_defenser_id"
    t.index ["fight_id"], name: "index_rounds_on_fight_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "attack"
    t.integer "defense"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
