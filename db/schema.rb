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

ActiveRecord::Schema.define(version: 20180309040831) do

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.string "schedule"
    t.string "rooms"
    t.string "semester"
    t.string "career"
    t.float "average", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "names"
    t.string "lastnames"
    t.string "name"
    t.string "control_number"
    t.string "career"
    t.string "grade"
    t.string "algorithm_level"
    t.string "course_level"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "names"
    t.string "lastnames"
    t.string "name"
    t.string "control_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "names", limit: 30, default: "Names"
    t.string "lastnames", limit: 30, default: "Lastname"
    t.string "name", limit: 60, default: "Name"
    t.string "control_number", default: "123456789"
    t.string "carrer", limit: 30, default: "Carrer"
    t.string "grade", limit: 30, default: "0"
    t.string "algorithm_level", limit: 30, default: "0"
    t.string "course_level", limit: 30, default: "0"
    t.string "score", limit: 30, default: "0"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
