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

ActiveRecord::Schema.define(version: 20180506055931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "coin_icos", force: :cascade do |t|
    t.bigint "launcher_id"
    t.text "description"
    t.string "coin_name"
    t.float "rate"
    t.integer "total_supply"
    t.string "website"
    t.string "presentation_link"
    t.string "facebook_link"
    t.string "twitter_link"
    t.string "telegram_link"
    t.string "coin_logo"
    t.string "cover_photo"
    t.string "white_paper"
    t.string "country"
    t.string "accepts"
    t.string "token_symbol"
    t.hstore "rounds"
    t.datetime "ico_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_approved"
    t.index ["launcher_id"], name: "index_coin_icos_on_launcher_id"
  end

  create_table "comment_likes", force: :cascade do |t|
    t.bigint "launcher_id"
    t.bigint "comment_id"
    t.boolean "is_liked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
    t.index ["launcher_id"], name: "index_comment_likes_on_launcher_id"
  end

  create_table "comment_replies", force: :cascade do |t|
    t.bigint "launcher_id"
    t.bigint "comment_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_replies_on_comment_id"
    t.index ["launcher_id"], name: "index_comment_replies_on_launcher_id"
  end

  create_table "comment_reply_likes", force: :cascade do |t|
    t.bigint "launcher_id"
    t.bigint "comment_reply_id"
    t.boolean "is_liked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_reply_id"], name: "index_comment_reply_likes_on_comment_reply_id"
    t.index ["launcher_id"], name: "index_comment_reply_likes_on_launcher_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "launcher_id"
    t.bigint "coin_ico_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_ico_id"], name: "index_comments_on_coin_ico_id"
    t.index ["launcher_id"], name: "index_comments_on_launcher_id"
  end

  create_table "favourite_icos", force: :cascade do |t|
    t.bigint "launcher_id"
    t.bigint "coin_ico_id"
    t.boolean "is_favourite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_ico_id"], name: "index_favourite_icos_on_coin_ico_id"
    t.index ["launcher_id"], name: "index_favourite_icos_on_launcher_id"
  end

  create_table "launchers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_no"
    t.index ["confirmation_token"], name: "index_launchers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_launchers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_launchers_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_launchers_on_unlock_token", unique: true
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "coin_ico_id"
    t.bigint "launcher_id"
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_ico_id"], name: "index_ratings_on_coin_ico_id"
    t.index ["launcher_id"], name: "index_ratings_on_launcher_id"
  end

  add_foreign_key "coin_icos", "launchers"
  add_foreign_key "comment_likes", "comments"
  add_foreign_key "comment_likes", "launchers"
  add_foreign_key "comment_replies", "comments"
  add_foreign_key "comment_replies", "launchers"
  add_foreign_key "comment_reply_likes", "comment_replies"
  add_foreign_key "comment_reply_likes", "launchers"
  add_foreign_key "comments", "coin_icos"
  add_foreign_key "comments", "launchers"
  add_foreign_key "favourite_icos", "coin_icos"
  add_foreign_key "favourite_icos", "launchers"
  add_foreign_key "ratings", "coin_icos"
  add_foreign_key "ratings", "launchers"
end
