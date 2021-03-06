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

ActiveRecord::Schema.define(:version => 20130623235451) do

  create_table "posts", :force => true do |t|
    t.string   "guid"
    t.text     "entry"
    t.integer  "subscription_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.datetime "published_at"
  end

  add_index "posts", ["published_at"], :name => "index_posts_on_published_at"
  add_index "posts", ["subscription_id", "guid"], :name => "index_posts_on_subscription_id_and_guid", :unique => true
  add_index "posts", ["subscription_id", "published_at"], :name => "index_posts_on_subscription_id_and_published_at"

  create_table "subscriptions", :force => true do |t|
    t.string   "feed_url"
    t.text     "feed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subscriptions", ["feed_url"], :name => "index_subscriptions_on_feed_url", :unique => true

end
