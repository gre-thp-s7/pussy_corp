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

ActiveRecord::Schema.define(version: 2019_03_06_153957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cart_products", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_command"
    t.string "product_list", array: true
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["product_list"], name: "index_orders_on_product_list", using: :gin
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "price"
    t.string "image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
<<<<<<< HEAD
    t.boolean "is_admin", default: false
=======
    t.boolean "is_admin"
>>>>>>> 3c78eb928e3e20814518c03d46e56dc0c0cf5228
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
