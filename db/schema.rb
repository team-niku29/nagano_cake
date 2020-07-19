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

ActiveRecord::Schema.define(version: 2020_07_15_115814) do

  create_table "addresses", force: :cascade do |t|
    t.integer "client_user_id", default: 0, null: false
    t.string "postal_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_user_id"], name: "index_addresses_on_client_user_id"
  end

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

  create_table "carts", force: :cascade do |t|
    t.integer "client_user_id", default: 0, null: false
    t.integer "product_id", default: 0, null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "family_name", default: "", null: false
    t.string "kana_first_name", default: "", null: false
    t.string "kana_family_name", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.text "address", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "tel", default: "", null: false
    t.string "email", default: "", null: false
    t.boolean "delete_status", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_client_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_client_users_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "invalid_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "orders_id", null: false
    t.integer "product_id", default: 0, null: false
    t.string "name", default: "", null: false
    t.integer "price", default: 0, null: false
    t.integer "quantity", default: 0, null: false
    t.integer "production_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "client_user_id", default: 0, null: false
    t.string "shipping_name", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "shipping_address", default: "", null: false
    t.integer "total_quantity", default: 0, null: false
    t.integer "charriage", default: 800, null: false
    t.integer "billing_amount", default: 0, null: false
    t.integer "status_flg", default: 0, null: false
    t.integer "payment_flg", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_user_id"], name: "index_orders_on_client_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id", default: 0, null: false
    t.string "name", default: "", null: false
    t.text "introduction", default: "", null: false
    t.integer "price_excluding", default: 0, null: false
    t.string "image_id"
    t.boolean "out_of_stock", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name"
  end

end
