# frozen_string_literal: true

module Orders
  class CalculateTotalPrice
    def initialize(order_summary)
      @order_summary = order_summary
    end

    def call
      order_summary.values.flatten.sum(0)
    end

    private

    attr_reader :order_summary
  end
end