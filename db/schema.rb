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

ActiveRecord::Schema.define(version: 2020_06_24_045002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bean_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bean_id", null: false
    t.index ["bean_id"], name: "bean_ind_on_bean_likes"
    t.index ["user_id"], name: "user_ind_on_bean_likes"
  end

  create_table "bean_translations", force: :cascade do |t|
    t.bigint "bean_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area"
    t.string "farm"
    t.index ["bean_id"], name: "index_bean_translations_on_bean_id"
    t.index ["locale"], name: "index_bean_translations_on_locale"
  end

  create_table "beans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shop_id"
    t.integer "country"
    t.string "area"
    t.integer "variety"
    t.string "farm"
    t.integer "process"
    t.integer "roast"
    t.integer "price"
    t.string "bean_image"
    t.date "roast_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "shop_ind_on_beans"
    t.index ["user_id"], name: "user_ind_on_beans"
  end

  create_table "impressions", force: :cascade do |t|
    t.integer "bean_id", null: false
    t.integer "i_sour"
    t.integer "i_sweet"
    t.integer "i_bitter"
    t.text "i_comment"
    t.index ["bean_id"], name: "bean_ind_on_impressions"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.index ["recipe_id"], name: "recipe_ind_on_recipe_likes"
    t.index ["user_id"], name: "user_ind_on_recipe_likes"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bean_id"
    t.integer "hot_ice", default: 0
    t.integer "grind"
    t.integer "temperature"
    t.integer "amount"
    t.integer "extracted_amount"
    t.integer "extraction"
    t.string "recipe_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "bean_ind_on_recipess"
    t.index ["user_id"], name: "user_ind_on_recipes"
  end

  create_table "shop_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.index ["shop_id"], name: "shop_ind_on_shop_likes"
    t.index ["user_id"], name: "user_ind_on_shop_likes"
  end

  create_table "shop_translations", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.index ["locale"], name: "index_shop_translations_on_locale"
    t.index ["shop_id"], name: "index_shop_translations_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "url"
    t.string "shop_image"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tastes", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "t_sour", null: false
    t.integer "t_sweet", null: false
    t.integer "t_bitter", null: false
    t.integer "t_aroma", null: false
    t.integer "t_fullbody", null: false
    t.text "t_comment"
    t.index ["recipe_id"], name: "recipe_ind_on_tastes"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "avatar"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "bean_likes", "beans", name: "fk_bean_likes_belong_to_bean"
  add_foreign_key "bean_likes", "users", name: "fk_bean_likes_belong_to_user"
  add_foreign_key "beans", "shops", name: "fk_beans_belong_to_shop"
  add_foreign_key "beans", "users", name: "fk_beans_belong_to_user"
  add_foreign_key "impressions", "beans", name: "fk_impression_belongs_to_bean"
  add_foreign_key "recipe_likes", "recipes", name: "fk_recipe_likes_belong_to_recipe"
  add_foreign_key "recipe_likes", "users", name: "fk_recipe_likes_belong_to_user"
  add_foreign_key "recipes", "beans", name: "fk_recipes_belong_to_bean"
  add_foreign_key "recipes", "users", name: "fk_recipes_belong_to_user"
  add_foreign_key "shop_likes", "shops", name: "fk_shop_likes_belong_to_shop"
  add_foreign_key "shop_likes", "users", name: "fk_shop_likes_belong_to_user"
  add_foreign_key "tastes", "recipes", name: "fk_taste_belongs_to_recipe"
end
