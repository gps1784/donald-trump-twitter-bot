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

ActiveRecord::Schema.define(version: 20180311023533) do

  create_table "markovs", force: :cascade do |t|
    t.string  "current",                    null: false
    t.string  "next",                       null: false
    t.integer "frequency",  default: 0,     null: false
    t.boolean "recent",     default: false, null: false
    t.integer "anger",      default: 0,     null: false
    t.integer "fear",       default: 0,     null: false
    t.integer "joy",        default: 0,     null: false
    t.integer "sadness",    default: 0,     null: false
    t.integer "analytical", default: 0,     null: false
    t.integer "confident",  default: 0,     null: false
    t.integer "tentative",  default: 0,     null: false
  end

  add_index "markovs", ["current"], name: "index_markovs_on_current"

  create_table "trump_tweets", id: false, force: :cascade do |t|
    t.integer  "id",           limit: 8,               null: false
    t.boolean  "parsed",                               null: false
    t.integer  "retweets",                 default: 0, null: false
    t.datetime "published_at",                         null: false
    t.text     "text",         limit: 511,             null: false
  end

end
