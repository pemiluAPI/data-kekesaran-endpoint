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

ActiveRecord::Schema.define(version: 20141119084744) do

  create_table "local_indices", force: true do |t|
    t.string "nama"
    t.string "violence_id"
  end

  add_index "local_indices", ["violence_id"], name: "index_local_indices_on_violence_id", using: :btree

  create_table "violences", force: true do |t|
    t.string "event_record_number"
    t.string "event_title"
    t.string "geographic"
    t.date   "initial_date"
    t.date   "final_date"
  end

end
