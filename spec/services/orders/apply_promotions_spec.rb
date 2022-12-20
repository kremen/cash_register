# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::ApplyPromotions, type: :service do
  subject(:service) do
    described_class.new(order_summary).call
  end

  let(:product1) { create(:product) }
  let(:product2) { create(:product) }
  let(:discount1) { 0.1 }
  let(:discount2) { 0.5 }
  let(:sale_promotion1) do
    create(:greater_or_equal_promotion, product_code: product1.code, discount: discount1, items_number: 3)
  end
  let(:sale_promotion2) do
    create(:last_in_group_promotion, product_code: product2.code, discount: discount2, items_number: 2)
  end
  let(:order_summary) do
    {
      product1.code => Array.new(2) { product1.price },
      product2.code => [product2.price]
    }
  end
  let(:expected_summary) { order_summary }

  describe '#call' do
    context 'when there is no sale promotions' do
      it 'does not apply any sale promotions' do
        expect(subject).to eq(expected_summary)
      end
    end

    context 'when there are sale promotions' do
      before do
        sale_promotion1
        sale_promotion2
      end

      context 'when there are not enough promotional items' do
        it 'does not apply any sale promotions' do
          expect(subject).to eq(expected_summary)
        end
      end

      context 'when there are enough promotional items' do
        let(:order_summary) do
          {
            product1.code => Array.new(3) { product1.price },
            product2.code => Array.new(3) { product2.price }
          }
        end
        let(:discount_multiplier1) { 1 - discount1 }
        let(:discount_multiplier2) { 1 - discount2 }
        let(:expected_summary) do
          {
            product1.code => Array.new(3) { product1.price * discount_multiplier1 },
            product2.code => [product2.price, product2.price * discount_multiplier2, product2.price]
          }
        end

        it 'applies sale promotions' do
          expect(subject).to eq(expected_summary)
        end
      end
    end
  end
end
