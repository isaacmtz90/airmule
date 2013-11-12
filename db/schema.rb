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

ActiveRecord::Schema.define(version: 20131112233941) do

  create_table "trips", force: true do |t|
    t.string   "from_city"
    t.string   "from_country"
    t.string   "to_city"
    t.string   "to_country"
    t.date     "to_when"
    t.date     "from_when"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "username"
    t.string   "password"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.string   "total_rating"
    t.string   "total_votes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

end
