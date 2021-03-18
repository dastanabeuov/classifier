ActiveRecord::Schema.define(version: 2020_06_08_051034) do

  enable_extension "plpgsql"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "synonym"
    t.string "code"
    t.date "version_date"
    t.boolean "publish"
    t.string "position"
    t.string "ancestry"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_activities_on_ancestry"
    t.index ["position"], name: "index_activities_on_position"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "properties", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "activity_id"
    t.string "propertyable_type"
    t.integer "propertyable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_properties_on_activity_id"
    t.index ["propertyable_type", "propertyable_id"], name: "index_properties_on_propertyable_type_and_propertyable_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "moderator", default: false
    t.boolean "paid_user", default: false
    t.boolean "guest", default: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "xcategories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "synonym"
    t.string "code"
    t.date "version_date"
    t.boolean "publish"
    t.integer "xroot_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_xcategories_on_user_id"
    t.index ["xroot_id"], name: "index_xcategories_on_xroot_id"
  end

  create_table "xclasses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "synonym"
    t.string "code"
    t.date "version_date"
    t.boolean "publish"
    t.boolean "xtype"
    t.string "position"
    t.string "ancestry"
    t.integer "xcategory_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_xclasses_on_ancestry"
    t.index ["position"], name: "index_xclasses_on_position"
    t.index ["user_id"], name: "index_xclasses_on_user_id"
    t.index ["xcategory_id"], name: "index_xclasses_on_xcategory_id"
  end

  create_table "xroots", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "synonym"
    t.string "code"
    t.date "version_date"
    t.boolean "publish"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_xroots_on_user_id"
  end
end
