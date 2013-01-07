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

ActiveRecord::Schema.define(:version => 20130107171134) do

  create_table "books", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "kind"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "books", ["kind"], :name => "index_books_on_kind"

  create_table "ingredients", :force => true do |t|
    t.integer  "recipe_id"
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "amount"
  end

  add_index "ingredients", ["name"], :name => "index_ingredients_on_name"
  add_index "ingredients", ["recipe_id"], :name => "index_ingredients_on_recipe_id"

  create_table "movies", :force => true do |t|
    t.string   "name"
    t.string   "kind"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "url"
  end

  add_index "movies", ["kind"], :name => "index_movies_on_kind"

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.string   "dish_type"
    t.string   "season"
    t.string   "diet"
    t.text     "directions"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "user_id"
    t.boolean  "gluten-free", :default => false
    t.boolean  "raw",         :default => false
    t.boolean  "gluten_free", :default => false
  end

  add_index "recipes", ["created_at"], :name => "index_recipes_on_created_at"
  add_index "recipes", ["name"], :name => "index_recipes_on_name"

  create_table "semesters", :force => true do |t|
    t.integer  "year"
    t.boolean  "semester"
    t.integer  "first_day"
    t.integer  "last_day"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "semesters", ["year", "semester"], :name => "index_semesters_on_year_and_semester"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "websites", :force => true do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "location"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "websites", ["kind"], :name => "index_websites_on_kind"

end
