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

ActiveRecord::Schema.define(version: 20160525074021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "posts_count", default: 0
    t.string   "title"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "likes_count",      default: 0
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["post_id"], name: "index_favorites_on_post_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "histories", force: :cascade do |t|
    t.string   "title"
    t.text     "history"
    t.boolean  "moderated",      default: false, null: false
    t.integer  "impressions",    default: 0,     null: false
    t.integer  "comments_count", default: 0
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["comment_id"], name: "index_likes_on_comment_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "comments_count",      default: 0
    t.integer  "favorites_count",     default: 0
    t.text     "sinopsis"
    t.text     "body"
    t.string   "title"
    t.integer  "impressions",         default: 0, null: false
    t.integer  "category_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "role",                   default: 0
    t.boolean  "is_admin",               default: false, null: false
    t.boolean  "weekly_mailing",         default: false, null: false
    t.string   "username"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "histories", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "users"
end
