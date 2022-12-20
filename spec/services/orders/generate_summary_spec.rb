# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::GenerateSummary, type: :service do
  subject(:service) do
    described_class.new(items).call
  end

  describe '#call' do
    context 'when items parameter is blank' do
      let(:items) { [] }
      let(:expected_summary) { {} }

      it 'generates order summary' do
        expect(subject).to eq(expected_summary)
      end
    end

    context 'when there is invalid item' do
      let(:items) { %w[A1] }
      let(:expected_summary) { nil }

      it 'generates order summary' do
        expect(subject).to eq(expected_summary)
      end
    end

    context 'when all items are valid' do
      let(:product1) { create(:product) }
      let(:product2) { create(:product) }
      let(:items) { [product1.code, product2.code, product1.code, product2.code, product1.code] }
      let(:expected_summary) do
        {
          product1.code => Array.new(3) { product1.price },
          product2.code => Array.new(2) { product2.price }
        }
      end

      it 'generates order summary' do
        expect(subject).to eq(expected_summary)
      end
    end
  end
end
