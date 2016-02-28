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

ActiveRecord::Schema.define(version: 20160228145156) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "listing_id", limit: 4
    t.datetime "starts_at"
    t.datetime "ends_at"
  end

  add_index "appointments", ["listing_id"], name: "index_appointments_on_listing_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "languages_users", id: false, force: :cascade do |t|
    t.integer "user_id",     limit: 4
    t.integer "language_id", limit: 4
  end

  add_index "languages_users", ["language_id"], name: "index_languages_users_on_language_id", using: :btree
  add_index "languages_users", ["user_id"], name: "index_languages_users_on_user_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.string   "video_url",   limit: 255
    t.integer  "price",       limit: 4
    t.boolean  "is_trial"
    t.string   "platform",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
    t.integer  "language_id", limit: 4
  end

  add_index "listings", ["language_id"], name: "index_listings_on_language_id", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",         limit: 65535
    t.integer  "conversation_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "comment",        limit: 65535
    t.integer  "star",           limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "appointment_id", limit: 4
  end

  add_index "reviews", ["appointment_id"], name: "index_reviews_on_appointment_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "image",                  limit: 255
    t.string   "type",                   limit: 255
    t.string   "phone",                  limit: 255
    t.string   "from",                   limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "skype",                  limit: 255
    t.string   "location",               limit: 255
    t.string   "time_zone",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "appointments", "listings"
  add_foreign_key "appointments", "users"
  add_foreign_key "listings", "languages"
  add_foreign_key "listings", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "appointments"
  add_foreign_key "reviews", "users"
end
