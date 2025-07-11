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

ActiveRecord::Schema.define(version: 2022_05_07_094513) do

  create_table "abuse_reports", charset: "utf8mb4", force: :cascade do |t|
    t.text "description"
    t.bigint "match_id"
    t.bigint "user_id"
    t.bigint "reported_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "action_text_rich_texts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "armies", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.text "title"
    t.text "army_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "army_faction"
  end

  create_table "battle_reports", charset: "utf8mb4", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_battle_reports_on_user_id"
  end

  create_table "countries", charset: "utf8mb4", force: :cascade do |t|
    t.text "name"
    t.text "short_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dev_notes", charset: "utf8mb4", force: :cascade do |t|
    t.text "title"
    t.text "intro"
    t.text "text"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friend_lists", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "inviting_user_id", null: false
    t.bigint "receiving_user_id", null: false
    t.integer "status", default: 0
    t.text "message", default: "''"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", charset: "utf8mb4", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "short_title"
  end

  create_table "games_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invitations", charset: "utf8mb4", force: :cascade do |t|
    t.string "message", limit: 2500
    t.bigint "match_id"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "language_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_pending_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "start_date"
    t.text "title"
    t.string "description", limit: 1200
    t.bigint "game_id"
    t.bigint "tournament_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tournament_round"
    t.float "longitude"
    t.float "latitude"
    t.bigint "user_id"
    t.string "status", default: "open"
    t.integer "max_player_number", default: 2000
    t.string "country", limit: 2000
    t.string "city", limit: 2000
    t.string "street", limit: 2000
    t.string "zip", limit: 2000
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "matches_player_attributes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "player_attribute_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_matches_player_attributes_on_user_id"
  end

  create_table "matches_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "match_score"
    t.boolean "accepted", default: false
    t.boolean "rated", default: false
  end

  create_table "messages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "tournament_id"
    t.bigint "player_group_id"
    t.string "message", limit: 2500
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unread", default: true
  end

  create_table "player_attributes", charset: "utf8mb4", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_attributes_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "player_attribute_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "votes", default: 0
  end

  create_table "player_groups", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "organizer_id"
    t.text "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_groups_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "player_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tournaments", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "start_date"
    t.text "title"
    t.string "summary", limit: 1200
    t.bigint "organizer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "street", limit: 60
    t.string "location", limit: 100
    t.text "special_rules"
    t.datetime "end_date"
    t.integer "max_player_number"
    t.integer "max_number_of_rounds", default: 3
    t.integer "current_round", default: 0
    t.bigint "game_id", default: 0
    t.string "zip_code", limit: 40
    t.bigint "country_id"
    t.text "city"
    t.text "tournament_type"
    t.datetime "armylist_deadline_date"
    t.datetime "armylists_visible_date"
    t.text "payment_type"
    t.datetime "payment_deadline_date"
    t.text "information"
    t.text "procedure"
    t.boolean "round_started"
    t.boolean "ended"
    t.datetime "round_started_at"
  end

  create_table "tournaments_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "longitude"
    t.float "latitude"
    t.string "nick_name"
    t.string "info", limit: 2000
    t.string "country", limit: 2000
    t.string "city", limit: 2000
    t.string "street", limit: 2000
    t.string "zip", limit: 2000
    t.boolean "is_admin", default: false
    t.string "locale", limit: 50
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
