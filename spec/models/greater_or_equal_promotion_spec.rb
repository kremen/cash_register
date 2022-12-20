# frozen_string_literal: true

# == Schema Information
#
# Table name: sale_promotions
#
#  id           :bigint           not null, primary key
#  discount     :float
#  items_number :integer
#  product_code :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe GreaterOrEqualPromotion, type: :model do
  subject(:sale_promotion) { build(:greater_or_equal_promotion, product_code:, discount:, items_number:) }

  let(:product_code) { 'SR1' }
  let(:discount) { 0.1 }
  let(:items_number) { 3 }

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:discount) }
  end

  describe '#apply' do
    let(:price) { Money.new(100) }

    context 'when there is no promotional products' do
      subject(:applied_promotion) { sale_promotion.apply(order_summary) }

      let(:order_summary) { { 'GR1' => Array.new(3) { price } } }
      let(:expected_order_summary) { order_summary }

      it 'does not update order summary' do
        expect(applied_promotion).to eq(expected_order_summary)
      end
    end

    context 'when there are not enough promotional products' do
      subject(:applied_promotion) { sale_promotion.apply(order_summary) }

      let(:order_summary) { { product_code => Array.new(2) { price } } }
      let(:expected_order_summary) { order_summary }

      it 'does not update order summary' do
        expect(applied_promotion).to eq(expected_order_summary)
      end
    end

    context 'when there are enough promotional products' do
      subject(:applied_promotion) { sale_promotion.apply(order_summary) }

      let(:order_summary) { { product_code => Array.new(4) { price } } }
      let(:discount_multiplier) { 1 - discount }
      let(:expected_order_summary) { { product_code => Array.new(4) { price * discount_multiplier } } }

      it 'updates order summary' do
        expect(applied_promotion).to eq(expected_order_summary)
      end
    end
  end
end
