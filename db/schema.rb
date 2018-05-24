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

ActiveRecord::Schema.define(version: 20180522131632) do

  create_table "algorithms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.integer "level"
    t.boolean "avaible"
    t.bigint "price"
    t.bigint "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "amethod_id"
    t.index ["amethod_id"], name: "index_algorithms_on_amethod_id"
  end

  create_table "amethods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "subject"
    t.text "description", limit: 4294967295
    t.string "description_subject"
    t.string "skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "links"
    t.text "books"
    t.text "references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id"
    t.index ["session_id"], name: "index_consultations_on_session_id"
  end

  create_table "exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_students_id"
    t.bigint "user_teachers_id"
    t.index ["user_students_id"], name: "index_exercises_on_user_students_id"
    t.index ["user_teachers_id"], name: "index_exercises_on_user_teachers_id"
  end

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

  create_table "question_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quiz_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "description"
    t.integer "approved"
    t.boolean "avaible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id"
    t.bigint "user_teacher_id"
    t.bigint "user_id"
    t.index ["session_id"], name: "index_quizzes_on_session_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
    t.index ["user_teacher_id"], name: "index_quizzes_on_user_teacher_id"
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "location"
    t.string "principal_name"
    t.string "typeSchool"
    t.string "grade"
    t.string "code"
    t.string "phone"
    t.string "web_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "txt1"
    t.text "txt2"
    t.text "txt3", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id"
    t.index ["session_id"], name: "index_session_details_on_session_id"
  end

  create_table "sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "avaible"
    t.bigint "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "algorithm_id"
    t.bigint "user_teacher_id"
    t.bigint "user_id"
    t.index ["algorithm_id"], name: "index_sessions_on_algorithm_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
    t.index ["user_teacher_id"], name: "index_sessions_on_user_teacher_id"
  end

  create_table "user_quizzes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "score", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.index ["quiz_id"], name: "index_user_quizzes_on_quiz_id"
    t.index ["user_id"], name: "index_user_quizzes_on_user_id"
  end

  create_table "user_sgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "school_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_sgs_on_group_id"
    t.index ["school_id"], name: "index_user_sgs_on_school_id"
    t.index ["user_id"], name: "index_user_sgs_on_user_id"
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
    t.bigint "user_id"
    t.bigint "user_quiz_id"
    t.integer "avatar", default: 0
    t.string "avatarn", default: "/avatar_student/boy.png"
    t.bigint "group_id"
    t.bigint "school_id"
    t.bigint "user_teacher_id"
    t.index ["group_id"], name: "index_user_students_on_group_id"
    t.index ["school_id"], name: "index_user_students_on_school_id"
    t.index ["user_id"], name: "index_user_students_on_user_id"
    t.index ["user_quiz_id"], name: "index_user_students_on_user_quiz_id"
    t.index ["user_teacher_id"], name: "index_user_students_on_user_teacher_id"
  end

  create_table "user_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "names"
    t.string "lastnames"
    t.string "name"
    t.string "control_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "avatar", default: 0
    t.string "avatarn", default: "/avatar_teacher/052-man-24.png"
    t.index ["user_id"], name: "index_user_teachers_on_user_id"
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
    t.string "authentication_token", limit: 30
    t.bigint "group_id"
    t.bigint "school_id"
    t.string "rol", limit: 30, default: "student"
    t.boolean "active", default: false
    t.boolean "pro", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "algorithms", "amethods"
  add_foreign_key "consultations", "sessions"
  add_foreign_key "exercises", "user_students", column: "user_students_id"
  add_foreign_key "exercises", "user_teachers", column: "user_teachers_id"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "sessions"
  add_foreign_key "quizzes", "user_teachers"
  add_foreign_key "quizzes", "users"
  add_foreign_key "session_details", "sessions"
  add_foreign_key "sessions", "algorithms"
  add_foreign_key "sessions", "user_teachers"
  add_foreign_key "sessions", "users"
  add_foreign_key "user_quizzes", "quizzes"
  add_foreign_key "user_quizzes", "users"
  add_foreign_key "user_sgs", "groups"
  add_foreign_key "user_sgs", "schools"
  add_foreign_key "user_sgs", "users"
  add_foreign_key "user_students", "groups"
  add_foreign_key "user_students", "schools"
  add_foreign_key "user_students", "user_teachers"
  add_foreign_key "user_students", "users"
  add_foreign_key "user_teachers", "users"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "schools"
end
