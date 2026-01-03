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

ActiveRecord::Schema[7.1].define(version: 2026_01_03_155650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asset_movements", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "asset_id", null: false
    t.bigint "from_location_id"
    t.bigint "to_location_id"
    t.bigint "from_user_id"
    t.bigint "to_user_id"
    t.integer "status", null: false
    t.datetime "moved_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_asset_movements_on_asset_id"
    t.index ["from_location_id"], name: "index_asset_movements_on_from_location_id"
    t.index ["from_user_id"], name: "index_asset_movements_on_from_user_id"
    t.index ["tenant_id", "asset_id", "moved_at"], name: "index_asset_movements_on_tenant_id_and_asset_id_and_moved_at"
    t.index ["tenant_id"], name: "index_asset_movements_on_tenant_id"
    t.index ["to_location_id"], name: "index_asset_movements_on_to_location_id"
    t.index ["to_user_id"], name: "index_asset_movements_on_to_user_id"
  end

  create_table "asset_responsibilities", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "user_id", null: false
    t.bigint "asset_id", null: false
    t.datetime "assigned_at", null: false
    t.datetime "removed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_asset_responsibilities_on_asset_id"
    t.index ["tenant_id", "asset_id", "assigned_at"], name: "idx_on_tenant_id_asset_id_assigned_at_f5f8d04284"
    t.index ["tenant_id"], name: "index_asset_responsibilities_on_tenant_id"
    t.index ["user_id"], name: "index_asset_responsibilities_on_user_id"
  end

  create_table "asset_types", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.string "name", null: false
    t.string "manufacturer"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_asset_types_on_tenant_id"
  end

  create_table "assets", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "asset_type_id", null: false
    t.bigint "location_id", null: false
    t.bigint "responsible_user_id"
    t.string "identifier", null: false
    t.string "serial_number"
    t.integer "status", default: 0, null: false
    t.date "acquired_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_type_id"], name: "index_assets_on_asset_type_id"
    t.index ["location_id"], name: "index_assets_on_location_id"
    t.index ["responsible_user_id"], name: "index_assets_on_responsible_user_id"
    t.index ["tenant_id", "identifier"], name: "index_assets_on_tenant_id_and_identifier", unique: true
    t.index ["tenant_id"], name: "index_assets_on_tenant_id"
  end

  create_table "found_assets", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "asset_id", null: false
    t.bigint "inventory_id", null: false
    t.bigint "reported_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_found_assets_on_asset_id"
    t.index ["inventory_id"], name: "index_found_assets_on_inventory_id"
    t.index ["reported_by_id"], name: "index_found_assets_on_reported_by_id"
    t.index ["tenant_id", "asset_id"], name: "index_found_assets_on_tenant_id_and_asset_id"
    t.index ["tenant_id"], name: "index_found_assets_on_tenant_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_inventories_on_location_id"
    t.index ["tenant_id", "location_id", "created_at"], name: "index_inventories_on_tenant_id_and_location_id_and_created_at"
    t.index ["tenant_id"], name: "index_inventories_on_tenant_id"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "inventory_assets", force: :cascade do |t|
    t.bigint "inventory_id", null: false
    t.bigint "asset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_inventory_assets_on_asset_id"
    t.index ["inventory_id", "asset_id"], name: "index_inventory_assets_on_inventory_id_and_asset_id", unique: true
    t.index ["inventory_id"], name: "index_inventory_assets_on_inventory_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.string "name", null: false
    t.integer "kind", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_locations_on_parent_id"
    t.index ["tenant_id"], name: "index_locations_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_locations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_user_locations_on_location_id"
    t.index ["tenant_id"], name: "index_user_locations_on_tenant_id"
    t.index ["user_id", "location_id", "tenant_id"], name: "index_user_locations_on_user_id_and_location_id_and_tenant_id", unique: true
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.bigint "tenant_id", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  add_foreign_key "asset_movements", "assets"
  add_foreign_key "asset_movements", "locations", column: "from_location_id"
  add_foreign_key "asset_movements", "locations", column: "to_location_id"
  add_foreign_key "asset_movements", "tenants"
  add_foreign_key "asset_movements", "users", column: "from_user_id"
  add_foreign_key "asset_movements", "users", column: "to_user_id"
  add_foreign_key "asset_responsibilities", "assets"
  add_foreign_key "asset_responsibilities", "tenants"
  add_foreign_key "asset_responsibilities", "users"
  add_foreign_key "asset_types", "tenants"
  add_foreign_key "assets", "asset_types"
  add_foreign_key "assets", "locations"
  add_foreign_key "assets", "tenants"
  add_foreign_key "assets", "users", column: "responsible_user_id"
  add_foreign_key "found_assets", "assets"
  add_foreign_key "found_assets", "inventories"
  add_foreign_key "found_assets", "tenants"
  add_foreign_key "found_assets", "users", column: "reported_by_id"
  add_foreign_key "inventories", "locations"
  add_foreign_key "inventories", "tenants"
  add_foreign_key "inventories", "users"
  add_foreign_key "inventory_assets", "assets"
  add_foreign_key "inventory_assets", "inventories"
  add_foreign_key "locations", "locations", column: "parent_id"
  add_foreign_key "locations", "tenants"
  add_foreign_key "user_locations", "locations"
  add_foreign_key "user_locations", "tenants"
  add_foreign_key "user_locations", "users"
  add_foreign_key "users", "tenants"
end
