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
class SalePromotion < ApplicationRecord
  validates :discount, presence: true
  validates :type, presence: true

  def apply(_order_summary)
    raise 'Not implemented!'
  end
end
