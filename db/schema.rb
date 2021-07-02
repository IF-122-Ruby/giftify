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

ActiveRecord::Schema.define(version: 2021_07_02_081550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "gift_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id"], name: "index_favorites_on_gift_id"
    t.index ["user_id", "gift_id"], name: "index_favorites_on_user_id_and_gift_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", limit: 255, null: false
    t.string "reason", null: false
    t.string "subject", limit: 15, null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "viewed", default: false, null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "amount"
    t.integer "price"
    t.string "gift_type"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["organization_id"], name: "index_gifts_on_organization_id"
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.string "recipient_email"
    t.string "invite_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "recipient_role", default: "user", null: false
    t.index ["invite_token"], name: "index_invites_on_invite_token", unique: true
    t.index ["organization_id"], name: "index_invites_on_organization_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "organization_id"
    t.string "title"
    t.text "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_microposts_on_author_id"
    t.index ["organization_id"], name: "index_microposts_on_organization_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.text "message"
    t.string "notification_type"
    t.boolean "read", default: false
    t.string "notificationable_type"
    t.bigint "notificationable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notificationable_type", "notificationable_id"], name: "index_notifications_on_notificationable"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.integer "monthly_point", default: 10
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.string "reaction"
    t.string "reactionable_type"
    t.bigint "reactionable_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reactionable_type", "reactionable_id"], name: "index_reactions_on_reactionable"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.string "role", default: "user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_roles_on_organization_id"
    t.index ["user_id", "organization_id"], name: "index_roles_on_user_id_and_organization_id", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.string "sender_type"
    t.bigint "sender_id"
    t.string "receiver_type"
    t.bigint "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_type", "receiver_id"], name: "index_transactions_on_receiver"
    t.index ["sender_type", "sender_id"], name: "index_transactions_on_sender"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "token"
    t.string "google_token"
    t.string "google_refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "microposts", "organizations"
  add_foreign_key "microposts", "users", column: "author_id"
  add_foreign_key "organizations", "users"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "users"
end
