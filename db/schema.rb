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

ActiveRecord::Schema.define(version: 2019_03_18_223703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aws_accounts", force: :cascade do |t|
    t.string "aws_id"
    t.string "aws_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "glacier_jobs", force: :cascade do |t|
    t.string "aws_job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vault_name"
    t.string "region_name"
    t.string "status"
    t.integer "aws_account_id"
  end

  create_table "glacier_vault_elements", force: :cascade do |t|
    t.integer "glacier_job_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
