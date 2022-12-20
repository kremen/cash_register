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
FactoryBot.define do
  factory :product do
    code { Faker::Alphanumeric.alpha(number: 10) }
    name { Faker::Name.name }
    price_cents { Faker::Commerce.price }
  end
end
