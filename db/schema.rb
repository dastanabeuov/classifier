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

ActiveRecord::Schema.define(version: 20200608051034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "synonym"
    t.string   "code"
    t.date     "version_date"
    t.boolean  "publish"
    t.string   "position"
    t.string   "ancestry"
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["ancestry"], name: "index_activities_on_ancestry", using: :btree
    t.index ["position"], name: "index_activities_on_position", using: :btree
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "activity_id"
    t.string   "propertyable_type"
    t.integer  "propertyable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["activity_id"], name: "index_properties_on_activity_id", using: :btree
    t.index ["propertyable_type", "propertyable_id"], name: "index_properties_on_propertyable_type_and_propertyable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "moderator",              default: false
    t.boolean  "paid_user",              default: false
    t.boolean  "guest",                  default: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "xcategories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "synonym"
    t.string   "code"
    t.date     "version_date"
    t.boolean  "publish"
    t.integer  "xroot_id",     null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_xcategories_on_user_id", using: :btree
    t.index ["xroot_id"], name: "index_xcategories_on_xroot_id", using: :btree
  end

  create_table "xclasses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "synonym"
    t.string   "code"
    t.date     "version_date"
    t.boolean  "publish"
    t.boolean  "xtype"
    t.string   "position"
    t.string   "ancestry"
    t.integer  "xcategory_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["ancestry"], name: "index_xclasses_on_ancestry", using: :btree
    t.index ["position"], name: "index_xclasses_on_position", using: :btree
    t.index ["user_id"], name: "index_xclasses_on_user_id", using: :btree
    t.index ["xcategory_id"], name: "index_xclasses_on_xcategory_id", using: :btree
  end

  create_table "xroots", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "synonym"
    t.string   "code"
    t.date     "version_date"
    t.boolean  "publish"
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_xroots_on_user_id", using: :btree
  end

end
