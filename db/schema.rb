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

ActiveRecord::Schema[7.2].define(version: 2024_08_04_183556) do
  create_table "answers", force: :cascade do |t|
    t.integer "game_session_player_id", null: false
    t.integer "question_id", null: false
    t.integer "choice_id", null: false
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id"
    t.index ["game_session_player_id", "question_id"], name: "index_answers_on_game_session_player_id_and_question_id", unique: true
    t.index ["game_session_player_id"], name: "index_answers_on_game_session_player_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string "text", null: false
    t.integer "position", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "game_session_players", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "game_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_game_session_players_on_game_session_id"
    t.index ["player_id"], name: "index_game_session_players_on_player_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.integer "game_id", null: false
    t.string "game_phase", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_question_id"
    t.index ["code"], name: "index_game_sessions_on_code", unique: true
    t.index ["current_question_id"], name: "index_game_sessions_on_current_question_id"
    t.index ["game_id"], name: "index_game_sessions_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "text", null: false
    t.integer "position", null: false
    t.integer "game_id", null: false
    t.integer "correct_choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correct_choice_id"], name: "index_questions_on_correct_choice_id"
    t.index ["game_id"], name: "index_questions_on_game_id"
  end

  add_foreign_key "answers", "choices"
  add_foreign_key "answers", "game_session_players"
  add_foreign_key "answers", "questions"
  add_foreign_key "choices", "questions"
  add_foreign_key "game_session_players", "game_sessions"
  add_foreign_key "game_session_players", "players"
  add_foreign_key "game_sessions", "games"
  add_foreign_key "game_sessions", "questions", column: "current_question_id"
  add_foreign_key "questions", "choices", column: "correct_choice_id"
  add_foreign_key "questions", "games"
end
