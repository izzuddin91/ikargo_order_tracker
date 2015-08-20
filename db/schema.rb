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

ActiveRecord::Schema.define(version: 20150810015851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.string   "user_email"
    t.date     "inquiry_date"
    t.string   "no"
    t.string   "shipper"
    t.text     "shipper_address"
    t.string   "transporter"
    t.string   "truck_size"
    t.string   "details"
    t.text     "remarks"
    t.string   "notes"
    t.date     "datetime"
    t.string   "goods_description"
    t.text     "pick_up_address_1"
    t.string   "pick_up_pic_no_1"
    t.text     "pick_up_address_2"
    t.string   "pick_up_pic_no_2"
    t.text     "pick_up_address_3"
    t.string   "pick_up_pic_no_3"
    t.text     "pick_up_address_4"
    t.string   "pick_up_pic_no_4"
    t.date     "drop_point_date"
    t.text     "drop_point_address_1"
    t.string   "drop_point_pic_no_1"
    t.text     "drop_point_address_2"
    t.string   "drop_point_pic_no_2"
    t.text     "drop_point_address_3"
    t.string   "drop_point_pic_no_3"
    t.text     "drop_point_address_4"
    t.string   "drop_point_pic_no_4"
    t.string   "special_request"
    t.string   "trucks_capacity"
    t.string   "truck_reg_no"
    t.string   "name"
    t.string   "ic"
    t.string   "phone_no"
    t.string   "driver_remarks"
    t.date     "delivery_date"
    t.date     "do_request_date"
    t.date     "do_collection_date"
    t.integer  "do_number"
    t.string   "total_tonne"
    t.string   "payment_name"
    t.string   "tel_no"
    t.string   "account_no"
    t.decimal  "payment_rate",                  precision: 8, scale: 2, default: 0.0
    t.decimal  "payment_with_gst",              precision: 8, scale: 2, default: 0.0
    t.decimal  "payment_advance",               precision: 8, scale: 2, default: 0.0
    t.decimal  "payment_paid",                  precision: 8, scale: 2, default: 0.0
    t.decimal  "payment_commision",             precision: 8, scale: 2, default: 0.0
    t.decimal  "payment_balance",               precision: 8, scale: 2, default: 0.0
    t.string   "rate"
    t.string   "billing_name"
    t.string   "billing_rate"
    t.decimal  "billing_amount",                precision: 8, scale: 2, default: 0.0
    t.decimal  "billing_received",              precision: 8, scale: 2, default: 0.0
    t.decimal  "billing_balance",               precision: 8, scale: 2, default: 0.0
    t.date     "invoice_date"
    t.string   "invoice"
    t.boolean  "payment_calculate_gst",                                 default: false
    t.boolean  "payment_reverse_calculate_gst",                         default: false
    t.boolean  "billing_calculate_gst",                                 default: false
    t.boolean  "billing_reverse_calculate_gst",                         default: false
    t.string   "gst_total_value"
    t.string   "gst_billing_total_value"
    t.string   "billing_with_gst"
    t.string   "delivered"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
