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

ActiveRecord::Schema.define(:version => 20131214064708) do

  create_table "contacts", :force => true do |t|
    t.integer  "encounter_id"
    t.integer  "user_instrument"
    t.integer  "partner_instrument"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "encounters", :force => true do |t|
    t.integer  "partner_id"
    t.boolean  "fluid"
    t.text     "notes"
    t.integer  "self_risk"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "took_place"
  end

  create_table "instruments", :force => true do |t|
    t.string   "part"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partners", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pref_id"
    t.string   "name"
    t.string   "frequency"
    t.integer  "familiarity"
    t.string   "exclusivity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "prefs", :force => true do |t|
    t.string   "genital_name"
    t.string   "anus_name"
    t.integer  "pronoun_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pronouns", :force => true do |t|
    t.string   "subject"
    t.string   "object"
    t.string   "possessive"
    t.string   "obj_possessive"
    t.string   "reflexive"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "pref_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
