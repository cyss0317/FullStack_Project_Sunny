# frozen_string_literal: true

# frozen_string_literal: true rubocop:disable Metrics/ClassLength

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

# rubocop:disable Metrics/BlockLength
ActiveRecord::Schema.define(version: 20_210_830_025_313) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'cart_items', force: :cascade do |t|
    t.integer 'cart_id', null: false
    t.integer 'product_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'quantity'
    t.index ['cart_id'], name: 'index_cart_items_on_cart_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', null: false
    t.string 'category', null: false
    t.string 'measurement'
    t.string 'color', null: false
    t.float 'price', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'highlights'
    t.index ['category'], name: 'index_products_on_category'
    t.index ['color'], name: 'index_products_on_color'
    t.index ['name'], name: 'index_products_on_name'
    t.index ['price'], name: 'index_products_on_price'
  end

  create_table 'reviews', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'product_id', null: false
    t.text 'comment', null: false
    t.float 'rating', null: false
    t.integer 'helpful'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['helpful'], name: 'index_reviews_on_helpful'
    t.index ['product_id'], name: 'index_reviews_on_product_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'session_token', null: false
    t.string 'password_digest', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'first_name', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['session_token'], name: 'index_users_on_session_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
end
# rubocop:enable Metrics/BlockLength
