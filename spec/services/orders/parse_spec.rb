# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::Parse, type: :service do
  subject(:service) do
    described_class.new(order_string).call
  end

  describe '#call' do
    context 'when string is nil' do
      let(:order_string) { nil }
      let(:expected_items) { [] }

      it 'parses order string' do
        expect(subject).to eq(expected_items)
      end
    end

    context 'when string is empty' do
      let(:order_string) { '' }
      let(:expected_items) { [] }

      it 'parses order string' do
        expect(subject).to eq(expected_items)
      end
    end

    context 'when string is not empty' do
      let(:order_string) { 'SR1, SR1, SR1,CF1,CF1,' }
      let(:expected_items) { %w[SR1 SR1 SR1 CF1 CF1] }

      it 'parses order string' do
        expect(subject).to eq(expected_items)
      end
    end
  end
end
