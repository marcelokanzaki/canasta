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

ActiveRecord::Schema[8.1].define(version: 2026_01_16_154252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "match_id", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_rounds_on_match_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "card_points", default: 0, null: false
    t.integer "clean_canastas", default: 0, null: false
    t.datetime "created_at", null: false
    t.integer "debt_points", default: 0, null: false
    t.integer "dirty_canastas", default: 0, null: false
    t.integer "full_canastas", default: 0, null: false
    t.integer "half_canastas", default: 0, null: false
    t.integer "knocks", default: 0, null: false
    t.bigint "player_id", null: false
    t.bigint "round_id", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_scores_on_player_id"
    t.index ["round_id"], name: "index_scores_on_round_id"
  end

  create_table "seats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "match_id", null: false
    t.bigint "player_id", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_seats_on_match_id"
    t.index ["player_id"], name: "index_seats_on_player_id"
  end

  add_foreign_key "rounds", "matches"
  add_foreign_key "scores", "players"
  add_foreign_key "scores", "rounds"
  add_foreign_key "seats", "matches"
  add_foreign_key "seats", "players"
end
