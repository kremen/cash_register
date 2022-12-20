# frozen_string_literal: true

# == Schema Information
#
# Table name: sale_promotions
#
#  id           :bigint           not null, primary key
#  discount     :float
#  items_number :integer
#  product_code :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :sale_promotion, class: 'SalePromotion' do
    discount { Faker::Number.within(range: 0.1..0.5) }
  end

  factory :greater_or_equal_promotion, class: 'GreaterOrEqualPromotion', parent: :sale_promotion
  factory :last_in_group_promotion, class: 'LastInGroupPromotion', parent: :sale_promotion
end
