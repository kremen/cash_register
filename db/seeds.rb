# frozen_string_literal: true

[
  { code: 'GR1', name: 'Green Tea', price_cents: 311 },
  { code: "SR1", name: "Strawberries", price_cents: 500 },
  { code: "CF1", name: "Coffee", price_cents: 1123 }
].each do |attributes|
  Product.find_or_create_by(code: attributes[:code]) { _1.assign_attributes(**attributes) }
end

[
  { product_code: 'GR1', discount: 1, type: 'LastInGroupPromotion', items_number: 2 },
  { product_code: 'SR1', discount: 0.1, type: 'GreaterOrEqualPromotion', items_number: 3 },
  { product_code: 'CF1', discount: 1/3.0, type: 'GreaterOrEqualPromotion', items_number: 3 }
].each do |attributes|
  SalePromotion.find_or_create_by(**attributes)
end