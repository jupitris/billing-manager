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

ActiveRecord::Schema.define(version: 20170126094520) do

  create_table "offices", force: :cascade do |t|
    t.string   "office_name",   limit: 255
    t.string   "postal_code",   limit: 255
    t.integer  "country_id",    limit: 4
    t.string   "prefecture",    limit: 255
    t.string   "city",          limit: 255
    t.string   "address_line1", limit: 255
    t.string   "address_line2", limit: 255
    t.string   "phone_number",  limit: 255
    t.string   "fax_number",    limit: 255
    t.string   "owner_name",    limit: 255
    t.integer  "delete_flg",    limit: 4
    t.integer  "created_by",    limit: 4
    t.datetime "created_at",                null: false
    t.integer  "updated_by",    limit: 4
    t.datetime "updated_at",                null: false
    t.integer  "user_id",       limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "provider",               limit: 255, default: "", null: false
    t.string   "uid",                    limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "token",                  limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
