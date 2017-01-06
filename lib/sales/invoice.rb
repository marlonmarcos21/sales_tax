class Invoice
  require 'csv'

  attr_reader :csv_file

  def initialize(*products)
    generate_invoice(products)
  end

  private

  def generate_invoice(products)
    total_tax = total_amount = BigDecimal.new(0.0, 4)

    csv_file = File.dirname(__FILE__) + '/../../invoices/invoice.csv'
    CSV.open(csv_file, 'wb') do |csv|
      csv << %w(Qty Item Amount)

      products.each do |product|
        sales_tax = Tax.calculate_tax(product)
        payable   = ((product.quantity * product.price) + sales_tax)

        total_tax    += sales_tax
        total_amount += payable

        csv << [product.quantity, product.product, "#{'%.2f' % payable.to_f}"]
      end

      csv << [nil]
      csv << ["Sales Taxes: #{'%.2f' % total_tax.to_f}"]
      csv << ["Total: #{'%.2f' % total_amount.to_f}"]
    end

    @csv_file = csv_file
  end
end
