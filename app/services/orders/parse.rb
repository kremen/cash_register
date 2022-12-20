# frozen_string_literal: true

module Orders
  class Parse
    def initialize(order_string)
      @order_string = order_string
    end

    def call
      return [] if order_string.blank?

      prepare_order_string.split(',')
    end

    private

    attr_reader :order_string

    def prepare_order_string
      order_string.upcase.gsub(Regexp.new('\s'), '')
    end
  end
end