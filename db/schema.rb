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

ActiveRecord::Schema.define(:version => 20120716221510) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "unlock_token"
    t.integer  "failed_logins_count",          :default => 0
    t.datetime "lock_expires_at"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email"
  add_index "accounts", ["name"], :name => "index_accounts_on_name"
  add_index "accounts", ["remember_me_token"], :name => "index_accounts_on_remember_me_token"
  add_index "accounts", ["unlock_token"], :name => "index_accounts_on_unlock_token"

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.date     "start_at"
    t.date     "end_at"
    t.string   "uri"
    t.string   "media"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "entries", ["account_id"], :name => "index_entries_on_account_id"
  add_index "entries", ["end_at"], :name => "index_entries_on_end_at"
  add_index "entries", ["media"], :name => "index_entries_on_media"
  add_index "entries", ["start_at"], :name => "index_entries_on_start_at"
  add_index "entries", ["title"], :name => "index_entries_on_title"
  add_index "entries", ["uri"], :name => "index_entries_on_uri"

  create_table "entries_tags", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "entry_id"
  end

  add_index "entries_tags", ["entry_id"], :name => "index_entries_tags_on_entry_id"
  add_index "entries_tags", ["tag_id"], :name => "index_entries_tags_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

end
