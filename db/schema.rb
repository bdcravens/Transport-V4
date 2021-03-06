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

ActiveRecord::Schema.define(version: 20150819161939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "shipment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "accepted"
    t.boolean  "rejected"
  end

  add_index "offers", ["shipment_id"], name: "index_offers_on_shipment_id", using: :btree
  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.string   "origin"
    t.string   "destination"
    t.string   "mode_of_transportation"
    t.string   "equipment_type"
    t.integer  "minimum_commitment"
    t.integer  "maximum_commitment"
    t.integer  "cost"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_shipments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shipment_id"
    t.string   "role"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_shipments", ["shipment_id"], name: "index_user_shipments_on_shipment_id", using: :btree
  add_index "user_shipments", ["user_id"], name: "index_user_shipments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "company_name"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "offers", "shipments"
  add_foreign_key "offers", "users"
  add_foreign_key "user_shipments", "shipments"
  add_foreign_key "user_shipments", "users"
end
