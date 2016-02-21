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

ActiveRecord::Schema.define(version: 20160221164337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baskets", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cart_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "customer_id"
    t.boolean  "active"
    t.boolean  "purchase"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "quantity"
    t.integer  "product_id"
    t.decimal  "basket"
    t.boolean  "shipped"
    t.string   "tracking_id"
    t.string   "shipping_vendor"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.string   "email"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "galileos", force: :cascade do |t|
    t.string   "controller"
    t.string   "view"
    t.integer  "object"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "referrer"
  end

  create_table "hq_users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "is_admin"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image_url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "is_main"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "orientation"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sorting"
  end

  create_table "product_notes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text     "name"
    t.decimal  "price"
    t.decimal  "height"
    t.decimal  "width"
    t.integer  "quantity"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "product_category_id"
    t.decimal  "length"
  end

end
