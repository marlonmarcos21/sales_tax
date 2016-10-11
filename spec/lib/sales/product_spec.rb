require 'spec_helper'

describe Product do
  let(:product) { Product.new(qty, item, price) }

  describe '#initialize' do
    let(:qty)   { 1 }
    let(:item)  { 'book' }
    let(:price) { 12.49 }

    it 'takes 3 arguments and stores it in the reader' do
      expect(product.quantity).to eq(1)
      expect(product.product).to eq('book')
      expect(product.price).to eq(12.49)
    end
  end
end
