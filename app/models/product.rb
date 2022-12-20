# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  code        :string
#  name        :string
#  price_cents :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_code  (code)
#
class Product < ApplicationRecord
  monetize :price_cents

  validates :code, uniqueness: true, presence: true
  validates :name, presence: true
  validates :price_cents, presence: true
end
