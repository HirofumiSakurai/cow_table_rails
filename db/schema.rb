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

ActiveRecord::Schema.define(version: 20150518044601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ai_logs", force: true do |t|
    t.integer  "cow_no"
    t.date     "date"
    t.string   "state"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daughters", force: true do |t|
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kine", force: true do |t|
    t.integer  "ear_num"
    t.integer  "owner_id"
    t.integer  "parent"
    t.string   "name"
    t.date     "birth"
    t.string   "sex"
    t.integer  "t1"
    t.integer  "t2"
    t.integer  "t3"
    t.integer  "t4"
    t.integer  "t5"
    t.integer  "t6"
    t.integer  "t7"
    t.integer  "t8"
    t.integer  "t9"
    t.integer  "t10"
    t.integer  "t11"
    t.integer  "t12"
    t.integer  "t13"
    t.integer  "t14"
    t.integer  "t15"
    t.integer  "t16"
    t.integer  "t17"
    t.integer  "t18"
    t.integer  "t19"
    t.integer  "t20"
    t.integer  "t21"
    t.integer  "t22"
    t.integer  "t23"
    t.integer  "t24"
    t.integer  "t25"
    t.integer  "t26"
    t.integer  "t27"
    t.integer  "t28"
    t.integer  "t29"
    t.integer  "t30"
    t.integer  "t31"
    t.integer  "t32"
    t.integer  "t33"
    t.integer  "t34"
    t.integer  "t35"
    t.integer  "t36"
    t.integer  "t37"
    t.integer  "t38"
    t.integer  "t39"
    t.integer  "t40"
    t.integer  "t41"
    t.integer  "t42"
    t.integer  "t43"
    t.integer  "t44"
    t.integer  "t45"
    t.integer  "t46"
    t.integer  "t47"
    t.integer  "t48"
    t.integer  "t49"
    t.integer  "t50"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
