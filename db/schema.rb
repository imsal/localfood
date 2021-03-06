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

ActiveRecord::Schema.define(version: 20170720170032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity", default: 1
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "street_address"
    t.string "suite"
    t.string "city"
    t.integer "state"
    t.string "zip_code"
    t.string "email"
    t.integer "pay_type"
    t.integer "status"
    t.decimal "final_total", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "wholesale_price", precision: 8, scale: 2
    t.decimal "retail_price", precision: 8, scale: 2
    t.decimal "discount_percentage", precision: 2, scale: 2
    t.datetime "discount_expiration_date"
    t.string "image_file_file_name"
    t.string "image_file_content_type"
    t.integer "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.bigint "user_id"
    t.string "temperature_requirements"
    t.integer "shelf_life_in_days"
    t.integer "max_hours_of_survival_in_transit"
    t.integer "min_num_of_qty_per_purchase"
    t.integer "max_num_of_qty_per_purchase"
    t.string "packaging_requirements"
    t.string "federal_and_state_shipping_laws"
    t.string "frozen_cold_room_temp_or_hot"
    t.string "flavor_tags"
    t.string "food_type_tags"
    t.string "external_model_number"
    t.string "slug"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "street_address"
    t.string "suite"
    t.string "city"
    t.integer "state"
    t.string "zip_code"
    t.string "business_name"
    t.string "food_category"
    t.text "notes"
    t.boolean "super_admin_role", default: false
    t.boolean "admin_role", default: false
    t.boolean "business_role", default: false
    t.boolean "customer_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "users"
end
