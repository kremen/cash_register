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
class LastInGroupPromotion < SalePromotion
  def apply(order_summary)
    item_prices = order_summary[product_code]
    return order_summary if item_prices.blank?

    order_summary[product_code] = item_prices.map.with_index do |price, index|
      item_discount = (index + 1) % items_number == 0 ? discount : 0
      price * (1 - item_discount)
    end
    order_summary
  end
end
