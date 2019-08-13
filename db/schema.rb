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

ActiveRecord::Schema.define(version: 2019_08_13_140158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "project_plans", force: :cascade do |t|
    t.integer "price", null: false
    t.text "description", null: false
    t.bigint "project_id", null: false
    t.date "esitimate_delivery_date", null: false
    t.boolean "limited_amount", default: false, null: false
    t.boolean "email_required", default: false, null: false
    t.boolean "shipping_info_required", default: false, null: false
    t.boolean "private_comment_required", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_plans_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "target_price", default: 0, null: false
    t.datetime "ended_at", null: false
    t.integer "success_condition", default: 0, null: false
    t.string "title", null: false
    t.text "short_blurb", null: false
    t.bigint "category_id", null: false
    t.string "video_url"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_projects_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "project_plans", "projects"
  add_foreign_key "projects", "categories"
end
