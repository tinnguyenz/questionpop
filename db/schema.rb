# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_14_130925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "content"
    t.string "shop_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.text "property"
    t.string "myshopify_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_contents", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_contents_on_question_id"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_name"
    t.string "customer_email"
    t.string "customer_phone"
    t.string "question_content"
    t.integer "shop_id"
    t.string "shop_domain"
    t.float "product_id"
    t.boolean "is_answered", default: false
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.integer "shop_id"
    t.string "user_message"
    t.string "notification_message"
    t.string "shop_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_settings_on_shop_id", unique: true
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

end
