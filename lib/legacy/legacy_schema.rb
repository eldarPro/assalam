# # This file is auto-generated from the current state of the database. Instead
# # of editing this file, please use the migrations feature of Active Record to
# # incrementally modify your database, and then regenerate this schema definition.
# #
# # This file is the source Rails uses to define your schema when running `bin/rails
# # db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# # be faster and is potentially less error prone than running all of your
# # migrations from scratch. Old migrations may fail to apply correctly if those
# # migrations use external dependencies or application code.
# #
# # It's strongly recommended that you check this file into your version control system.

# ActiveRecord::Schema[8.1].define(version: 2025_11_24_173439) do
#   # These are extensions that must be enabled in order to support this database
#   enable_extension "pg_catalog.plpgsql"

#   # Custom types defined in this database.
#   # Note that some types may not work with other database engines. Be careful if changing database.
#   create_enum "gender", ["male", "female"]

#   create_table "articles", force: :cascade do |t|
#     t.text "audio"
#     t.text "body"
#     t.bigint "category_id", null: false
#     t.datetime "created_at", null: false
#     t.text "photo"
#     t.text "preview"
#     t.bigint "release_id", null: false
#     t.text "title", null: false
#     t.datetime "updated_at", null: false
#     t.index ["category_id"], name: "index_articles_on_category_id"
#     t.index ["release_id"], name: "index_articles_on_release_id"
#   end

#   create_table "bookmarks", force: :cascade do |t|
#     t.bigint "article_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id", null: false
#     t.index ["article_id"], name: "index_bookmarks_on_article_id"
#     t.index ["user_id"], name: "index_bookmarks_on_user_id"
#   end

#   create_table "categories", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.string "name", null: false
#     t.bigint "parent_id"
#     t.string "pathname", null: false
#     t.string "temp"
#     t.datetime "updated_at", null: false
#     t.index ["parent_id"], name: "index_categories_on_parent_id"
#   end

#   create_table "comments", force: :cascade do |t|
#     t.bigint "article_id", null: false
#     t.datetime "created_at", null: false
#     t.text "message", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id", null: false
#     t.index ["article_id"], name: "index_comments_on_article_id"
#     t.index ["user_id"], name: "index_comments_on_user_id"
#   end

#   create_table "news", force: :cascade do |t|
#     t.string "ah1"
#     t.integer "author_id"
#     t.text "body", null: false
#     t.datetime "created_at", null: false
#     t.string "description"
#     t.date "event_date"
#     t.string "keys"
#     t.string "original"
#     t.string "path", null: false
#     t.string "photo", null: false
#     t.date "published_at"
#     t.string "title", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "releases", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.string "general_number", null: false
#     t.string "hidjra_date", null: false
#     t.string "pdf", null: false
#     t.string "photo", null: false
#     t.date "published_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "year_number", null: false
#   end

#   create_table "sessions", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.string "ip_address"
#     t.datetime "updated_at", null: false
#     t.string "user_agent"
#     t.bigint "user_id", null: false
#     t.index ["user_id"], name: "index_sessions_on_user_id"
#   end

#   create_table "subscriptions", force: :cascade do |t|
#     t.integer "action_type"
#     t.datetime "created_at", null: false
#     t.string "memo"
#     t.integer "payment_type"
#     t.date "paymented_at", null: false
#     t.bigint "tariff_id", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id", null: false
#     t.index ["tariff_id"], name: "index_subscriptions_on_tariff_id"
#     t.index ["user_id"], name: "index_subscriptions_on_user_id"
#   end

#   create_table "tariffs", force: :cascade do |t|
#     t.integer "price", null: false
#     t.string "title", null: false
#     t.integer "valid_day", null: false
#   end

#   create_table "users", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.string "email"
#     t.string "fio"
#     t.enum "gender", enum_type: "gender"
#     t.string "password_digest", null: false
#     t.string "phone", null: false
#     t.datetime "updated_at", null: false
#     t.index ["phone"], name: "index_users_on_phone", unique: true
#   end

#   create_table "web_admin", id: false, force: :cascade do |t|
#     t.string "fio", limit: 255, null: false
#     t.serial "id", null: false
#     t.string "mail", limit: 100, null: false
#     t.string "pass", limit: 255, null: false
#     t.string "phone", limit: 20, null: false
#     t.string "status", limit: 6, null: false
#     t.string "sysmod", limit: 255, null: false
#     t.index ["id"], name: "web_admin_idx1", unique: true
#   end

#   create_table "web_articles", force: :cascade do |t|
#     t.string "accall", limit: 3, null: false
#     t.text "all_text"
#     t.string "allmail", limit: 3, null: false
#     t.string "audio", limit: 255
#     t.integer "category_id", null: false
#     t.datetime "dt", precision: 0, default: -> { "now()" }, null: false
#     t.string "general", limit: 3, default: "0", null: false
#     t.text "main_photo"
#     t.text "main_text"
#     t.integer "release_id", null: false
#     t.tsvector "textsearchable_index_col"
#     t.text "title"
#     t.index ["category_id"], name: "web_articles_idx3_copy1_copy1_copy1"
#     t.index ["id"], name: "web_articles_idx1_copy1_copy1_copy1", unique: true
#     t.index ["release_id"], name: "web_articles_idx2_copy1_copy1_copy1"
#     t.index ["textsearchable_index_col"], name: "textsearch_idx_copy1_copy1_copy1", using: :gin
#   end

#   create_table "web_articles_comments", id: :serial, force: :cascade do |t|
#     t.integer "article_id", null: false
#     t.datetime "dt", precision: 0, default: -> { "now()" }, null: false
#     t.text "message", null: false
#     t.string "status", limit: 3, null: false
#     t.integer "user_id", null: false
#     t.index ["article_id"], name: "web_articles_comments_idx2"
#     t.index ["id"], name: "web_articles_comments_idx1"
#     t.index ["user_id"], name: "web_articles_comments_idx3"
#   end

#   create_table "web_articles_copy1", id: :bigint, default: -> { "nextval('web_articles_id_seq'::regclass)" }, force: :cascade do |t|
#     t.string "accall", limit: 3, null: false
#     t.text "all_text"
#     t.string "allmail", limit: 3, null: false
#     t.string "audio", limit: 255
#     t.integer "category_id", null: false
#     t.datetime "dt", precision: 0, default: -> { "now()" }, null: false
#     t.string "general", limit: 3, default: "0", null: false
#     t.text "main_photo"
#     t.text "main_text"
#     t.integer "release_id", null: false
#     t.tsvector "textsearchable_index_col"
#     t.text "title"
#     t.index ["category_id"], name: "web_articles_idx3_copy1_copy1_copy1_copy1"
#     t.index ["id"], name: "web_articles_idx1_copy1_copy1_copy1_copy1", unique: true
#     t.index ["release_id"], name: "web_articles_idx2_copy1_copy1_copy1_copy1"
#     t.index ["textsearchable_index_col"], name: "textsearch_idx_copy1_copy1_copy1_copy1", using: :gin
#   end

#   create_table "web_articles_stat", id: :serial, force: :cascade do |t|
#     t.integer "art_id", null: false
#     t.integer "stat", default: 1, null: false
#     t.index ["art_id"], name: "web_articles_stat_idx2"
#     t.index ["id"], name: "web_articles_stat_idx1"
#   end

#   create_table "web_clientele", id: :serial, force: :cascade do |t|
#     t.string "authtype", limit: 3, default: "1", null: false
#     t.date "dayoff"
#     t.string "geo", limit: 255, null: false
#     t.string "login", limit: 255, null: false
#     t.string "mail", limit: 30, null: false
#     t.string "name", limit: 255, null: false
#     t.string "partner", limit: 10, null: false
#     t.text "password", null: false
#     t.string "phone", limit: 30, null: false
#     t.string "regtype", limit: 3, null: false
#     t.string "shownamaz", limit: 1
#     t.string "status", limit: 3, default: "0", null: false
#     t.string "url", limit: 255, null: false
#     t.index ["id"], name: "web_clientele_idx1"
#   end

#   create_table "web_clientele_bookmark", primary_key: ["id", "client_id", "articles_id"], force: :cascade do |t|
#     t.integer "articles_id", null: false, comment: "материал"
#     t.integer "client_id", null: false, comment: "клиент"
#     t.serial "id", null: false
#     t.index ["articles_id"], name: "web_clientele_bookmark_idx3"
#     t.index ["client_id"], name: "web_clientele_bookmark_idx2"
#     t.index ["id"], name: "web_clientele_bookmark_idx1"
#   end

#   create_table "web_clientele_call_log", id: :serial, force: :cascade do |t|
#     t.bigint "clientele_id", null: false
#     t.datetime "dt", precision: 0
#     t.text "info", default: "0", null: false
#     t.integer "user_id"
#     t.index ["id"], name: "web_clientele_idx1_copy1"
#   end

#   create_table "web_clientele_cash", id: :serial, force: :cascade do |t|
#     t.integer "client_id", null: false
#     t.integer "log_id", null: false
#     t.integer "partner_id", null: false
#     t.string "status", limit: 3, null: false
#     t.integer "tariff_id", null: false
#     t.index ["client_id"], name: "web_clientele_cash_idx3"
#     t.index ["id"], name: "web_clientele_cash_idx1"
#     t.index ["log_id"], name: "web_clientele_cash_idx4"
#     t.index ["partner_id"], name: "web_clientele_cash_idx2"
#     t.index ["tariff_id"], name: "web_clientele_cash_idx5"
#   end

#   create_table "web_clientele_log", id: :serial, force: :cascade do |t|
#     t.string "action_id", limit: 3, null: false
#     t.integer "client_id", null: false
#     t.datetime "date_payment", precision: 0, default: -> { "now()" }, null: false
#     t.string "memo", limit: 255, null: false
#     t.integer "partner_id", null: false
#     t.string "payment_partner", limit: 3, null: false
#     t.integer "tariff_id", null: false
#     t.string "type_payment", limit: 3, null: false
#     t.index ["action_id"], name: "web_clientele_log_idx4"
#     t.index ["client_id"], name: "web_clientele_log_idx3"
#     t.index ["id"], name: "web_clientele_log_idx1"
#     t.index ["partner_id"], name: "web_clientele_log_idx2"
#     t.index ["tariff_id"], name: "web_clientele_log_idx5"
#   end

#   create_table "web_clientele_pushkey", id: :serial, force: :cascade do |t|
#     t.integer "client_id", null: false, comment: "клиент"
#     t.string "push_key", limit: 500, comment: "ключ"
#   end

#   create_table "web_clientele_tariff", id: :serial, force: :cascade do |t|
#     t.string "price", limit: 255, null: false
#     t.string "title", limit: 255, null: false
#     t.string "valid_day", limit: 4, null: false
#     t.index ["id"], name: "web_clientele_tariff_idx1"
#   end

#   create_table "web_discount_category", id: :bigint, default: nil, force: :cascade do |t|
#     t.string "title", limit: 255
#     t.index ["id"], name: "web_service_category_idx1_copy1"
#   end

#   create_table "web_discount_partner", force: :cascade do |t|
#     t.string "about", limit: 500, comment: "описание"
#     t.string "addr", limit: 255, comment: "адрес"
#     t.string "f", limit: 10, comment: "1 уровень"
#     t.text "geo"
#     t.string "geo_lat", limit: 255, comment: "лат"
#     t.string "geo_lon", limit: 255, comment: "лон"
#     t.string "s", limit: 10, comment: "2 уровень"
#     t.string "status", limit: 1, comment: "статус"
#     t.string "t", limit: 10, comment: "3 уровень"
#     t.string "title", limit: 255, comment: "название"
#   end

#   create_table "web_discount_region", id: false, force: :cascade do |t|
#     t.serial "id", null: false
#     t.string "title", null: false
#   end

#   create_table "web_discount_type", id: :bigint, default: nil, force: :cascade do |t|
#     t.string "title", limit: 255
#     t.index ["id"], name: "web_service_category_idx1_copy1_copy1"
#   end

#   create_table "web_discount_user", force: :cascade do |t|
#     t.string "fio", limit: 255
#     t.string "password", limit: 255
#     t.string "phone", limit: 15
#     t.string "region_id", limit: 11, default: "0", null: false
#     t.string "status", limit: 1
#     t.string "type", limit: 255, default: "1"
#     t.string "user_type", limit: 255
#   end

#   create_table "web_guide_author", force: :cascade do |t|
#     t.text "about", comment: "об авторе, звания, регалии, достижения"
#     t.string "fio", limit: 255, comment: "ФИО"
#     t.string "photo", limit: 255, comment: "фото, аватар"
#     t.index ["id"], name: "web_guide_author_idx1"
#   end

#   create_table "web_guide_paper_category", id: :serial, force: :cascade do |t|
#     t.text "name", null: false
#     t.integer "parent_id", null: false
#     t.text "pathname", null: false
#     t.index ["id"], name: "web_guide_paper_category_idx1"
#     t.index ["parent_id"], name: "web_guide_paper_category_idx2"
#   end

#   create_table "web_guide_www_category", id: :bigint, default: -> { "nextval('web_guide_category_www_id_seq'::regclass)" }, force: :cascade do |t|
#     t.string "name", limit: 255
#     t.string "pathname", limit: 255
#     t.string "temp", limit: 255
#     t.index ["id"], name: "web_guide_www_category_idx1"
#   end

#   create_table "web_modules", id: false, force: :cascade do |t|
#     t.serial "id", null: false
#     t.string "name", limit: 100, null: false
#     t.string "path", limit: 100, null: false
#     t.string "show_nav", limit: 1
#     t.index ["id"], name: "web_modules_idx1"
#   end

#   create_table "web_namaz_city", id: :bigint, default: nil, force: :cascade do |t|
#     t.string "calc_type", limit: 255
#     t.string "city_title", limit: 255
#     t.string "city_title_en", limit: 255
#     t.string "latitude", limit: 255
#     t.string "locality_info", limit: 255
#     t.string "longitude", limit: 255
#     t.string "region_id", limit: 255
#     t.string "region_text", limit: 255
#   end

#   create_table "web_namaz_federal", id: :bigint, default: nil, force: :cascade do |t|
#     t.string "federal_district", limit: 255
#   end

#   create_table "web_namaz_region", id: false, force: :cascade do |t|
#     t.string "federal_district_id", limit: 255
#     t.bigint "id"
#     t.string "region", limit: 255
#     t.string "type", limit: 255
#   end

#   create_table "web_namaz_time", id: false, force: :cascade do |t|
#     t.string "asr", limit: 5
#     t.bigint "city"
#     t.date "date"
#     t.string "fadjr", limit: 5
#     t.string "isha", limit: 5
#     t.string "magrib", limit: 5
#     t.string "voshod", limit: 5
#     t.string "zuhr", limit: 5
#   end

#   create_table "web_page", force: :cascade do |t|
#     t.text "page_content", null: false
#     t.date "page_create_date"
#     t.text "page_descrioption", null: false
#     t.text "page_key", null: false
#     t.string "page_path", limit: 765, null: false
#     t.string "page_title", limit: 765, null: false
#     t.index ["id"], name: "web_page_idx1"
#   end

#   create_table "web_paper_order", id: :serial, force: :cascade do |t|
#     t.string "addr", limit: 255
#     t.datetime "datetime"
#     t.string "language", limit: 2
#     t.string "mail", limit: 255
#     t.string "name", limit: 255
#     t.string "phone", limit: 255
#     t.string "soname", limit: 255
#     t.string "status", limit: 1, comment: "0-не оплачено 1- оплачено"
#     t.string "type", limit: 1, comment: "1-покупка 2 заявка"
#   end

#   create_table "web_paper_order_log", id: :integer, default: -> { "nextval('web_paper_order_log_seq'::regclass)" }, force: :cascade do |t|
#     t.datetime "dt", precision: 0
#     t.text "info", default: "0", null: false
#     t.bigint "paper_id", null: false
#     t.integer "user_id"
#     t.index ["id"], name: "web_clientele_idx1_copy1_copy1"
#   end

#   create_table "web_paper_release", force: :cascade do |t|
#     t.text "about_issue"
#     t.string "audio", limit: 255
#     t.integer "circulation", null: false
#     t.text "hidjra_date"
#     t.text "main_pdf", null: false
#     t.text "main_photo"
#     t.date "r_date"
#     t.string "release_date", limit: 255
#     t.text "release_number"
#     t.text "sequentially_art", null: false
#     t.string "status", limit: 3, default: "0", null: false
#     t.string "type_issue", limit: 3
#     t.index ["id"], name: "web_paper_release_idx1"
#   end

#   create_table "web_partner", id: :serial, force: :cascade do |t|
#     t.string "cardnum", limit: 25, null: false
#     t.text "fio", null: false
#     t.datetime "last_change_pass", precision: 0, default: -> { "now()" }, null: false
#     t.text "link", null: false
#     t.text "mail", null: false
#     t.integer "parent", null: false
#     t.string "password", limit: 32, null: false
#     t.text "phone", null: false
#     t.string "region", limit: 255, null: false
#     t.string "status", limit: 3, null: false
#     t.integer "type_work", comment: "1-сотрудник"
#     t.index ["id"], name: "web_partner_idx1"
#   end

#   create_table "web_partner_nav", id: :serial, force: :cascade do |t|
#     t.string "name", limit: 255, null: false
#     t.string "path", limit: 255, null: false
#     t.index ["id"], name: "web_partner_nav_idx1"
#   end

#   create_table "web_partner_stat", id: :serial, force: :cascade do |t|
#     t.integer "partner_id", null: false
#     t.integer "stat", default: 0, null: false
#     t.index ["id"], name: "web_partner_stat_idx1"
#     t.index ["partner_id"], name: "web_partner_stat_idx2"
#   end

#   create_table "web_partner_stat_data", id: :serial, force: :cascade do |t|
#     t.string "cookieinfo", limit: 500
#     t.datetime "datetime", precision: nil
#     t.string "info", limit: 500
#     t.integer "partner_id", null: false
#     t.index ["id"], name: "web_partner_stat_idx1_copy1"
#     t.index ["partner_id"], name: "web_partner_stat_idx2_copy1"
#   end

#   create_table "web_press", id: :serial, force: :cascade do |t|
#     t.string "adesc", limit: 255, null: false
#     t.string "ah1", limit: 255, null: false
#     t.string "akey", limit: 255, null: false
#     t.string "atitle", limit: 255, null: false
#     t.integer "author_id", null: false
#     t.integer "category_id", null: false
#     t.text "content", null: false
#     t.date "event_date"
#     t.string "export", limit: 50, null: false
#     t.datetime "lastdate_action_date", precision: 0, default: -> { "now()" }, null: false
#     t.string "original", limit: 255, null: false
#     t.string "path", limit: 255, null: false
#     t.string "preview", limit: 255, null: false
#     t.date "pub_date"
#     t.string "status", limit: 3, null: false
#     t.string "vital", limit: 3, default: "0", null: false
#     t.index ["author_id"], name: "web_press_idx3"
#     t.index ["category_id"], name: "web_press_idx2"
#     t.index ["id"], name: "web_press_idx1"
#   end

#   create_table "web_press_category", id: :serial, force: :cascade do |t|
#     t.string "status", limit: 3, default: "1", null: false
#     t.string "title", limit: 255, null: false
#     t.index ["id"], name: "web_press_category_idx1"
#   end

#   create_table "web_press_stat", id: :serial, force: :cascade do |t|
#     t.integer "press_id", null: false
#     t.integer "stat", default: 1, null: false
#     t.index ["id"], name: "web_press_stat_idx1"
#     t.index ["press_id"], name: "web_press_stat_idx2"
#   end

#   create_table "web_qa", force: :cascade do |t|
#     t.bigint "alim_id"
#     t.text "answer"
#     t.string "author_id", limit: 64
#     t.bigint "category_id"
#     t.datetime "creation_date", precision: 0
#     t.datetime "last_modified_date", precision: 0
#     t.string "links", limit: 500
#     t.text "question"
#     t.string "resource", limit: 255
#     t.integer "school_id"
#     t.string "status", limit: 1
#     t.string "tags", limit: 255
#     t.string "theme_id", limit: 64
#     t.index ["alim_id"], name: "web_qa_idx3"
#     t.index ["author_id"], name: "web_qa_idx2"
#     t.index ["category_id"], name: "web_qa_idx4"
#     t.index ["id"], name: "web_qa_idx1"
#     t.index ["school_id"], name: "web_qa_idx6"
#     t.index ["theme_id"], name: "web_qa_idx5"
#   end

#   create_table "web_qa_category", force: :cascade do |t|
#     t.bigint "parent_id"
#     t.string "title", limit: 255
#     t.index ["id"], name: "web_qa_category_idx1"
#     t.index ["parent_id"], name: "web_qa_category_idx2"
#   end

#   create_table "web_qa_school", force: :cascade do |t|
#     t.string "title", limit: 255
#     t.index ["id"], name: "web_qa_school_idx1"
#   end

#   create_table "web_qa_theme", force: :cascade do |t|
#     t.bigint "category_id"
#     t.string "tags", limit: 500
#     t.string "title", limit: 255
#     t.index ["category_id"], name: "web_qa_theme_idx2"
#     t.index ["id"], name: "web_qa_theme_idx1"
#   end

#   create_table "web_service_category", force: :cascade do |t|
#     t.string "path", limit: 255
#     t.string "title", limit: 255
#     t.index ["id"], name: "web_service_category_idx1"
#   end

#   create_table "web_service_company", primary_key: ["id", "service_id"], force: :cascade do |t|
#     t.string "about", limit: 255
#     t.string "about_dop", limit: 5000
#     t.json "geo"
#     t.string "geo_lat", limit: 255
#     t.string "geo_lon", limit: 255
#     t.string "geo_np", limit: 255
#     t.string "geo_obl", limit: 255
#     t.bigserial "id", null: false
#     t.string "photo", limit: 255
#     t.string "region_id", limit: 255
#     t.bigint "service_id", null: false
#     t.integer "status", limit: 2
#     t.string "title", limit: 255
#     t.index ["id"], name: "web_service_company_idx1"
#     t.index ["region_id"], name: "web_service_company_idx2"
#     t.index ["service_id"], name: "web_service_company_idx3"
#   end

#   create_table "web_service_contact", primary_key: ["id", "company_id"], force: :cascade do |t|
#     t.bigint "company_id", null: false
#     t.bigint "contact_id"
#     t.bigserial "id", null: false
#     t.string "meaning", limit: 255
#     t.index ["company_id"], name: "web_service_contact_idx2"
#     t.index ["contact_id"], name: "web_service_contact_idx3"
#     t.index ["id"], name: "web_service_contact_idx1"
#   end

#   create_table "web_service_contact_type", force: :cascade do |t|
#     t.string "title", limit: 255
#     t.index ["id"], name: "web_service_contact_type_idx1"
#   end

#   create_table "web_support_message", force: :cascade do |t|
#     t.text "answer"
#     t.string "author_id", limit: 255
#     t.datetime "creation_date", precision: nil
#     t.datetime "last_modified_date", precision: 0
#     t.text "question"
#     t.string "status", limit: 1
#     t.string "techdata", limit: 1000
#     t.string "version_sys", limit: 50
#   end

#   add_foreign_key "articles", "categories"
#   add_foreign_key "articles", "releases"
#   add_foreign_key "bookmarks", "articles"
#   add_foreign_key "bookmarks", "users"
#   add_foreign_key "categories", "categories", column: "parent_id"
#   add_foreign_key "comments", "articles"
#   add_foreign_key "comments", "users"
#   add_foreign_key "sessions", "users"
#   add_foreign_key "subscriptions", "tariffs"
#   add_foreign_key "subscriptions", "users"
# end
