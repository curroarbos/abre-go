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

ActiveRecord::Schema[7.1].define(version: 2023_12_06_012635) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.string "location"
    t.integer "max_people"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.bigint "category_id"
    t.boolean "in_house"
    t.float "duration"
    t.text "description"
    t.index ["category_id"], name: "index_activities_on_category_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "number_of_people"
    t.boolean "status"
    t.bigint "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "property_id"
    t.bigint "time_slot_id"
    t.date "day"
    t.index ["activity_id"], name: "index_bookings_on_activity_id"
    t.index ["property_id"], name: "index_bookings_on_property_id"
    t.index ["time_slot_id"], name: "index_bookings_on_time_slot_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "config_time_slots", force: :cascade do |t|
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_config_time_slots_on_activity_id"
  end

  create_table "days_time_slots", force: :cascade do |t|
    t.time "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "config_time_slot_id"
    t.string "day"
    t.integer "frequency"
    t.integer "interval"
    t.index ["config_time_slot_id"], name: "index_days_time_slots_on_config_time_slot_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "embedded_link"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.string "recommendable_type"
    t.bigint "recommendable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_recommendations_on_property_id"
    t.index ["recommendable_type", "recommendable_id"], name: "index_recommendations_on_recommendable"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "search_name"
    t.string "name"
    t.string "address"
    t.float "rating"
    t.integer "review_count"
    t.string "telephone_number"
    t.string "google_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "photo_url"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.float "rating"
    t.bigint "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["activity_id"], name: "index_reviews_on_activity_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.boolean "booked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["activity_id"], name: "index_time_slots_on_activity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "photo_url"
    t.boolean "is_provider", default: false
    t.string "phone_number"
    t.boolean "is_owner", default: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "categories"
  add_foreign_key "activities", "users"
  add_foreign_key "bookings", "activities"
  add_foreign_key "bookings", "properties"
  add_foreign_key "bookings", "time_slots"
  add_foreign_key "bookings", "users"
  add_foreign_key "config_time_slots", "activities"
  add_foreign_key "days_time_slots", "config_time_slots"
  add_foreign_key "properties", "users"
  add_foreign_key "recommendations", "properties"
  add_foreign_key "reviews", "activities"
  add_foreign_key "reviews", "users"
  add_foreign_key "time_slots", "activities"
end
