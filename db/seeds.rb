# frozen_string_literal: true

[
  { code: 'GR1', name: 'Green Tea', price_cents: 311 },
  { code: "SR1", name: "Strawberries", price_cents: 500 },
  { code: "CF1", name: "Coffee", price_cents: 1123 }
].each do |attributes|
  Product.find_or_create_by(code: attributes[:code]) { _1.assign_attributes(**attributes) }
end