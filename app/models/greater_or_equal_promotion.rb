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
class GreaterOrEqualPromotion < SalePromotion
  def apply(order_summary)
    item_prices = order_summary[product_code]
    return order_summary if item_prices.blank?

    items_count = item_prices.count
    return order_summary if items_count < items_number

    order_summary[product_code] = item_prices.map { _1 * (1 - discount) }
    order_summary
  end
end
