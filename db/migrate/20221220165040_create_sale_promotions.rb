# frozen_string_literal: true

class CreateSalePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_promotions do |t|
      t.string :type
      t.string :product_code
      t.integer :items_number
      t.float :discount

      t.timestamps
    end
  end
end
