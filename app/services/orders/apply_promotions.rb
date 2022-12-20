# frozen_string_literal: true

module Orders
  class ApplyPromotions
    def initialize(order_summary)
      @order_summary = order_summary
    end

    def call
      SalePromotion.find_each { _1.apply(order_summary) }
      order_summary
    end

    private

    attr_reader :order_summary
  end
end