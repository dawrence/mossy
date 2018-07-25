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

ActiveRecord::Schema.define(version: 20180719023136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.integer "sale_point_id"
    t.string "description"
    t.boolean "published", default: true
    t.datetime "published_at"
    t.datetime "published_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_point_id"], name: "index_categories_on_sale_point_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "supply_id", null: false
    t.string "magnitude"
    t.integer "amount", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "sale_point_id"
    t.integer "product_category_id", null: false
    t.float "price", default: 0.0
    t.boolean "published"
    t.datetime "published_at"
    t.datetime "published_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["sale_point_id"], name: "index_products_on_sale_point_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_recipes_on_product_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sale_point_id"
    t.string "description"
    t.integer "supply_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_point_id"], name: "index_supplies_on_sale_point_id"
    t.index ["supply_category_id"], name: "index_supplies_on_supply_category_id"
  end

end
