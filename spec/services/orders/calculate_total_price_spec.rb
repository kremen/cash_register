# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::CalculateTotalPrice, type: :service do
  subject(:service) do
    described_class.new(order_summary).call
  end

  describe '#call' do
    context 'when order summary is filled' do
      let(:order_summary) do
        {
          code1: [Money.new(100), Money.new(200), Money.new(150)],
          code2: [Money.new(50), Money.new(300), Money.new(250)],
        }
      end
      let(:expected_total_price) { Money.new(1050) }

      it 'calculates total price' do
        expect(subject).to eq(expected_total_price)
      end
    end

    context 'when order summary is empty' do
      let(:order_summary) { {} }
      let(:expected_total_price) { 0 }

      it 'calculates total price' do
        expect(subject).to eq(expected_total_price)
      end
    end
  end
end
