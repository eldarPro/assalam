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

ActiveRecord::Schema[8.1].define(version: 2025_11_24_173439) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "gender", ["male", "female"]

  create_table "articles", force: :cascade do |t|
    t.text "audio"
    t.text "body"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.text "photo"
    t.text "preview"
    t.date "published_at"
    t.bigint "release_id", null: false
    t.text "title", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["release_id"], name: "index_articles_on_release_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["article_id"], name: "index_bookmarks_on_article_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "pathname", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.text "message", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.integer "author_id"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.string "description"
    t.date "event_date"
    t.string "keys"
    t.string "original"
    t.string "path"
    t.string "photo", null: false
    t.date "published_at"
    t.string "title", null: false
    t.datetime "updated_at", null: false
  end

  create_table "releases", force: :cascade do |t|
    t.integer "circulation", null: false
    t.datetime "created_at", null: false
    t.integer "general_number", null: false
    t.string "hidjra_date", null: false
    t.string "pdf", null: false
    t.string "photo", null: false
    t.date "published_at", null: false
    t.string "r_date"
    t.datetime "updated_at", null: false
    t.integer "year_number", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "memo"
    t.integer "payment_type"
    t.date "paymented_at", null: false
    t.bigint "tariff_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["tariff_id"], name: "index_subscriptions_on_tariff_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tariffs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "days", null: false
    t.integer "price", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "fio"
    t.enum "gender", enum_type: "gender"
    t.string "password_digest", null: false
    t.string "phone"
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "releases"
  add_foreign_key "bookmarks", "articles"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "subscriptions", "tariffs"
  add_foreign_key "subscriptions", "users"
end
