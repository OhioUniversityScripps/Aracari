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

ActiveRecord::Schema.define(:version => 20130414032556) do

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

  create_table "imports", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "archive_file_name"
    t.string   "archive_content_type"
    t.integer  "archive_file_size"
    t.datetime "archive_updated_at"
  end

  create_table "records", :force => true do |t|
    t.string   "legacy_asset_id"
    t.string   "title"
    t.string   "creators"
    t.string   "category"
    t.text     "content_description"
    t.boolean  "further_review"
    t.string   "assessors"
    t.string   "collection_id"
    t.string   "shelf_code"
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.string   "generation"
    t.string   "unique_id"
    t.string   "size"
    t.string   "media_type"
    t.string   "speed"
    t.string   "stock_manufacturer"
    t.string   "track_configuration"
    t.string   "stock_brand"
    t.string   "tape_thickness"
    t.string   "stock_formula"
    t.string   "tape_playback_direction"
    t.string   "asset_age"
    t.string   "tape_width"
    t.string   "known_running_time"
    t.string   "tape_noise_reduction"
    t.boolean  "popped_strands"
    t.boolean  "stepped_pack"
    t.boolean  "flange_pack"
    t.boolean  "unsecured_tape"
    t.boolean  "heads_out"
    t.boolean  "vinegar_odor"
    t.boolean  "other_odor"
    t.boolean  "backing_loss"
    t.boolean  "binder_loss"
    t.boolean  "blocking"
    t.boolean  "brittleness"
    t.boolean  "breakage"
    t.boolean  "cinching"
    t.boolean  "cupping"
    t.boolean  "delamination"
    t.boolean  "edge_curling"
    t.boolean  "edge_damage"
    t.boolean  "stretching"
    t.boolean  "spoking"
    t.boolean  "windowing"
    t.boolean  "wrinkling"
    t.boolean  "dirt_dust"
    t.boolean  "fungus"
    t.boolean  "liquid"
    t.boolean  "pest"
    t.boolean  "slotted_hub"
    t.boolean  "splices"
    t.boolean  "record_cassette_cracks"
    t.boolean  "record_cassette_delamination"
    t.boolean  "record_cassette_scratches"
    t.boolean  "record_cassette_surface_contamination"
    t.boolean  "record_cassette_warping"
    t.text     "condition_notes"
    t.text     "notes"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
