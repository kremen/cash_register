# frozen_string_literal: true

module Orders
  class GenerateSummary
    def initialize(items)
      @items = items
    end

    def call
      item_counts = items.tally
      item_counts.each_with_object({}) do |(code, count), hash|
        product = Product.find_by(code: code)
        return if product.blank?

        hash[code] = Array.new(count) { product.price }
      end
    end

    private

    attr_reader :items
  end
end