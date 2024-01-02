# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_12_24_160215) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_admin_managed_resources", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "action", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["class_name", "action", "name"], name: "active_admin_managed_resources_index", unique: true
  end

  create_table "active_admin_permissions", force: :cascade do |t|
    t.integer "managed_resource_id", null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.integer "department_id"
    t.index ["department_id"], name: "index_admin_users_on_department_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "status"
    t.integer "admin_user_id", null: false
    t.date "attendance_date"
    t.index ["admin_user_id"], name: "index_attendances_on_admin_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer "admin_user_id", null: false
    t.string "qualification"
    t.string "institute_name"
    t.date "start_year"
    t.date "end_year"
    t.string "specialization"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_user_id"], name: "index_educations_on_admin_user_id"
  end

  create_table "employee_types", force: :cascade do |t|
    t.string "employee_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_user_id", null: false
    t.index ["admin_user_id"], name: "index_employee_types_on_admin_user_id"
  end

  create_table "leave_types", force: :cascade do |t|
    t.string "leave_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leaves", force: :cascade do |t|
    t.integer "status"
    t.integer "admin_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.index ["admin_user_id"], name: "index_leaves_on_admin_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "address"
    t.integer "department_id", null: false
    t.integer "admin_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile_picture"
    t.index ["admin_user_id"], name: "index_profiles_on_admin_user_id"
    t.index ["department_id"], name: "index_profiles_on_department_id"
  end

  create_table "staff_experiences", force: :cascade do |t|
    t.string "total_experience"
    t.string "certificate"
    t.integer "admin_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_user_id"], name: "index_staff_experiences_on_admin_user_id"
  end

  add_foreign_key "attendances", "admin_users"
  add_foreign_key "educations", "admin_users"
  add_foreign_key "employee_types", "admin_users"
  add_foreign_key "leaves", "admin_users"
  add_foreign_key "profiles", "admin_users"
  add_foreign_key "profiles", "departments"
  add_foreign_key "staff_experiences", "admin_users"
end
