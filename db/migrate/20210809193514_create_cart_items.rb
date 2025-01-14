# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id, null: false
      t.integer :product_id

      t.timestamps
    end
    add_index :cart_items, :cart_id, unique: true
  end
end
