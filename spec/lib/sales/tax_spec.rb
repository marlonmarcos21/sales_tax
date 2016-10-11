require 'spec_helper'

describe Tax do  
  let(:tax) { Tax.new(product) }

  describe 'initializing and getting sales_tax' do
    let(:product) { Product.new(1, 'book', 12.49) }

    it 'takes product object as an argument and stores it in the reader' do
      expect(tax.product).to eq(product)
    end

    it 'calculates the tax rate and stores it in the reader' do
      expect(tax.tax_rate).to eq(0)
    end

    it 'have no payable tax' do
      expect(tax.sales_tax).to eq(0)
    end

    describe 'products with no tax exemption' do
      let(:product) { Product.new(1, 'music cd', 14.99) }

      it 'should be taxable' do
        expect(tax.tax_rate).to eq(0.1)
      end

      it 'should be able to calculate the correct payable tax' do
        expect(tax.sales_tax).to eq(1.5)
      end
    end

    describe 'imported products' do
      context 'when product is basic tax exempted' do
        let(:product) { Product.new(1, 'imported box of chocolates', 10.00) }

        it 'should only have the additional import duty tax' do
          expect(tax.tax_rate).to eq(0.05)
        end

        it 'should be able to calculate the correct payable tax' do
          expect(tax.sales_tax).to eq(0.5)
        end
      end

      context 'when product is not basic tax exempted' do
        let(:product) { Product.new(1, 'imported bottle of perfume', 47.50) }

        it 'should have the basic tax plus additional import duty tax' do
          expect(tax.tax_rate).to eq(0.15)
        end

        it 'should be able to calculate the correct payable tax' do
          expect(tax.sales_tax).to eq(7.15)
        end
      end
    end
  end
end
