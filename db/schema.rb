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

ActiveRecord::Schema.define(version: 20140204140652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tags", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_updates", force: true do |t|
    t.integer "tag_id"
    t.integer "update_id"
  end

  create_table "updates", force: true do |t|
    t.integer  "tag_id"
    t.integer  "user_id"
    t.text     "content"
    t.text     "twilio_body"
    t.string   "duration",    default: "1"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["tag_id"], name: "up_tag_id_ix", using: :btree
  add_index "updates", ["user_id"], name: "up_user_id_ix", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                           null: false
    t.string   "encrypted_password",     default: "",                           null: false
    t.string   "cellphone",              default: "",                           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "timezone",               default: "Pacific Time (US & Canada)", null: false
    t.string   "habits",                 default: [],                                        array: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
