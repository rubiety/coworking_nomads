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

ActiveRecord::Schema.define(:version => 20110403212457) do

  create_table "check_ins", :force => true do |t|
    t.integer  "venue_id"
    t.integer  "user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "check_ins", ["user_id"], :name => "index_check_ins_on_user_id"
  add_index "check_ins", ["venue_id"], :name => "index_check_ins_on_venue_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_suggestions", :force => true do |t|
    t.string   "name"
    t.string   "from_name"
    t.string   "from_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "venue_id"
    t.integer  "user_id"
    t.boolean  "active",                    :default => false
    t.integer  "rating"
    t.integer  "wifi_rating"
    t.string   "wifi_notes"
    t.integer  "ambiance_rating"
    t.string   "ambiance_notes"
    t.integer  "table_availability_rating"
    t.string   "table_availability_notes"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"
  add_index "reviews", ["venue_id"], :name => "index_reviews_on_venue_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.integer  "city_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                               :default => false
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "biography"
    t.string   "website"
    t.string   "twitter"
    t.string   "linked_in"
    t.string   "github"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["city_id"], :name => "index_users_on_city_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venue_photos", :force => true do |t|
    t.integer  "venue_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_suggestions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_suggestions", ["city_id"], :name => "index_venue_suggestions_on_city_id"
  add_index "venue_suggestions", ["user_id"], :name => "index_venue_suggestions_on_user_id"

  create_table "venues", :force => true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.boolean  "active",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["city_id"], :name => "index_venues_on_city_id"

end
