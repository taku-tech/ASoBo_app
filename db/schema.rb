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

ActiveRecord::Schema.define(version: 2020_08_15_035502) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "choices", force: :cascade do |t|
    t.integer "word_id"
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_choices_on_word_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["word_id"], name: "index_favorites_on_word_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "word_id"
    t.boolean "is_done", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
    t.index ["word_id"], name: "index_questions_on_word_id"
  end

  create_table "result_details", force: :cascade do |t|
    t.integer "word_id"
    t.integer "result_id"
    t.string "selected_choice", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_result_details_on_result_id"
    t.index ["word_id"], name: "index_result_details_on_word_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.integer "genre_id"
    t.string "english", null: false
    t.string "japanese", null: false
    t.string "image_id", null: false
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["english"], name: "index_words_on_english"
    t.index ["genre_id"], name: "index_words_on_genre_id"
    t.index ["japanese"], name: "index_words_on_japanese"
  end

end
