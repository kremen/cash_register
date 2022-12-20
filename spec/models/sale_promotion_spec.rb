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

RSpec.describe SalePromotion, type: :model do
  subject(:sale_promotion) { build(:sale_promotion) }

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:discount) }
  end

  describe '#apply' do
    it 'raises error' do
      expect { sale_promotion.apply({}) }.to raise_error('Not implemented!')
    end
  end
end
