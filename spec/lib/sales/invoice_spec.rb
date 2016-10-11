require 'spec_helper'

describe Invoice do  
  describe 'generating invoice' do
    subject { Invoice.new(*products) }

    context 'Expected Invoice 1' do
      let(:product1) { Product.new(1, 'book', 12.49) }
      let(:product2) { Product.new(1, 'music CD', 14.99) }
      let(:product3) { Product.new(1, 'chocolate bar', 0.85) }
      let(:products) { [product1, product2, product3] }

      it 'takes multiple product objects as an argument and generates a csv as an invoice' do
        generated_invoice = File.read(subject.csv_file)
        expected_invoice  = File.read(File.dirname(__FILE__) + '/../../invoices/invoice1.csv')
        expect(generated_invoice).to eq(expected_invoice)
      end
    end

    context 'Expected Invoice 2' do
      let(:product1) { Product.new(1, 'imported box of chocolates', 10.00) }
      let(:product2) { Product.new(1, 'imported bottle of perfume', 47.50) }
      let(:products) { [product1, product2] }

      it 'takes multiple product objects as an argument and generates a csv as an invoice' do
        generated_invoice = File.read(subject.csv_file)
        expected_invoice  = File.read(File.dirname(__FILE__) + '/../../invoices/invoice2.csv')
        expect(generated_invoice).to eq(expected_invoice)
      end
    end

    context 'Expected Invoice 3' do
      let(:product1) { Product.new(1, 'imported bottle of perfume', 27.99) }
      let(:product2) { Product.new(1, 'bottle of perfume', 18.99) }
      let(:product3) { Product.new(1, 'packet of headache pills', 9.75) }
      let(:product4) { Product.new(1, 'imported box of chocolates', 11.25) }
      let(:products) { [product1, product2, product3, product4] }

      it 'takes multiple product objects as an argument and generates a csv as an invoice' do
        generated_invoice = File.read(subject.csv_file)
        expected_invoice  = File.read(File.dirname(__FILE__) + '/../../invoices/invoice3.csv')
        expect(generated_invoice).to eq(expected_invoice)
      end
    end
  end
end
