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

ActiveRecord::Schema.define(version: 2019_11_25_061734) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_images", force: :cascade do |t|
    t.string "link"
    t.integer "cat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_items", force: :cascade do |t|
    t.integer "cat_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cat_items_on_cart_id"
    t.index ["cat_id"], name: "index_cat_items_on_cat_id"
  end

  create_table "cat_rates", force: :cascade do |t|
    t.integer "rate_point"
    t.string "comment"
    t.integer "user_id"
    t.integer "cat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_cat_rates_on_cat_id"
    t.index ["user_id"], name: "index_cat_rates_on_user_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.integer "price"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "point"
  end

  create_table "food_images", force: :cascade do |t|
    t.string "link"
    t.integer "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_rates", force: :cascade do |t|
    t.integer "rate_point"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "food_id"
    t.integer "user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.integer "price"
    t.boolean "supportable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "point"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "food_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["food_id"], name: "index_line_items_on_food_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
