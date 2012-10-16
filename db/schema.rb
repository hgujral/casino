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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121011180029) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "event_registrations", :force => true do |t|
    t.string   "event_name"
    t.string   "event_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "tickets_booked"
    t.integer  "tickets_available"
    t.boolean  "pre_auth"
    t.boolean  "played"
    t.string   "status"
    t.boolean  "no_show"
    t.string   "code"
    t.string   "block"
    t.string   "center"
    t.string   "authorizer"
    t.string   "entered_by"
    t.integer  "patron_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "gaming_trip_summaries", :force => true do |t|
    t.datetime "played_at"
    t.integer  "average_bet"
    t.decimal  "percent_table"
    t.decimal  "percent_slot"
    t.integer  "total_points"
    t.integer  "total_ng_comp"
    t.integer  "adt"
    t.integer  "adl"
    t.integer  "days_without_play"
    t.decimal  "wl_after_tax"
    t.decimal  "buy_in"
    t.integer  "coin_in"
    t.string   "credit_action"
    t.integer  "patron_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "gaming_trips", :force => true do |t|
    t.datetime "played_at"
    t.integer  "average_bet"
    t.decimal  "percent_table"
    t.decimal  "percent_slot"
    t.integer  "total_points"
    t.integer  "total_ng_comp"
    t.integer  "adt"
    t.integer  "adl"
    t.decimal  "wl_after_tax"
    t.decimal  "buy_in"
    t.integer  "coin_in"
    t.string   "credit_action"
    t.integer  "gaming_trip_summary_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "patrons", :force => true do |t|
    t.string   "card_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "dob"
    t.string   "gender"
    t.string   "aka"
    t.string   "passport_number"
    t.string   "ethnicity"
    t.string   "ssn"
    t.string   "mail_code"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "other_phone"
    t.string   "dl_state"
    t.string   "dl_number"
    t.datetime "dl_expires_at"
    t.string   "home_address"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "home_zip"
    t.string   "home_country"
    t.string   "business_name"
    t.string   "business_address"
    t.string   "business_city"
    t.string   "business_state"
    t.string   "business_zip"
    t.string   "busines_country"
    t.string   "tier_level"
    t.integer  "tier_balance"
    t.integer  "points_to_next_tier"
    t.string   "acsc_code_status"
    t.integer  "adt"
    t.string   "representative"
    t.integer  "point_balance"
    t.integer  "agent_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "remarks", :force => true do |t|
    t.text     "description"
    t.datetime "expired_at"
    t.integer  "agent_id"
    t.integer  "patron_id"
    t.string   "visible_to"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "entered_by_code"
    t.string   "entered_by_name"
    t.datetime "entered_at"
  end

  create_table "slot_trip_summaries", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "duration"
    t.integer  "average_bet"
    t.integer  "coin_in"
    t.integer  "coin_out"
    t.integer  "jackpot"
    t.integer  "theo_win_loss"
    t.integer  "total_loss"
    t.string   "credit_action"
    t.integer  "patron_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "slot_trips", :force => true do |t|
    t.datetime "start_at"
    t.integer  "duration"
    t.string   "zone_location"
    t.string   "asset"
    t.integer  "average_bet"
    t.integer  "coin_in"
    t.integer  "coin_out"
    t.integer  "pull_rate"
    t.integer  "theo_win_loss"
    t.integer  "total_loss"
    t.string   "credit_action"
    t.integer  "slot_trip_summary_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "table_trip_summaries", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "duration"
    t.integer  "average_bet"
    t.integer  "total_buy_in"
    t.integer  "buy_in_cash"
    t.integer  "buy_in_check"
    t.integer  "buy_in_chip"
    t.integer  "win_loss"
    t.string   "credit_action"
    t.integer  "patron_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "table_trips", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "average_bet"
    t.integer  "total_buy_in"
    t.integer  "buy_in_cash"
    t.integer  "buy_in_check"
    t.integer  "buy_in_chip"
    t.integer  "win_loss"
    t.string   "credit_action"
    t.integer  "table_trip_summary_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
