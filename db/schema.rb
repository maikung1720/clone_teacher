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

ActiveRecord::Schema.define(version: 20180721074855) do

  create_table "labwares", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity",    default: 0
    t.string   "code"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "image"
    t.integer  "circulation", default: 0
  end

  create_table "products", force: :cascade do |t|
    t.string   "search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental_details", force: :cascade do |t|
    t.integer  "rental_id"
    t.integer  "labware_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.datetime "rental_date"
    t.datetime "due_date"
    t.integer  "User_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "rack_no"
  end

  add_index "rentals", ["User_id"], name: "index_rentals_on_User_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "name"
    t.text     "image"
    t.string   "card_no"
    t.integer  "number"
    t.integer  "class_rooom"
    t.integer  "studentid"
    t.string   "telephon"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
