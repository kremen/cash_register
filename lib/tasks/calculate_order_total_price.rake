# frozen_string_literal: true

task calculate_order_total_price: :environment do
  puts "There are #{Product.count} products:"
  price_format = '%n %u'
  Product.find_each { puts "#{_1.code}: #{_1.name} - #{_1.price.format(format: price_format)}" }
  puts "Enter your order, please (Eg. #{Product.limit(3).pluck(:code).join(',')}):"
  order_string = STDIN.gets
  items = Orders::Parse.new(order_string).call

  order_summary = Orders::GenerateSummary.new(items).call
  if order_summary.blank?
    puts 'Invalid product code!'
    next
  end

  order_summary = Orders::ApplyPromotions.new(order_summary).call

  total_price = Orders::CalculateTotalPrice.new(order_summary).call
  puts "Total price:"
  puts total_price.format(format: price_format)
end