class Invoice
  require 'csv'

  attr_reader :csv_file

  def initialize(*products)
    generate_invoice(products)
  end

  private

  def generate_invoice(products)
    total_tax = 0.0
    total_amount = 0.0

    csv_file = File.dirname(__FILE__) + '/../../invoices/invoice.csv'
    CSV.open(csv_file, 'wb') do |csv|
      csv << %w(Qty Item Amount)

      products.each do |product|
        sales_tax = calculate_tax(product)
        payable   = ((product.quantity * product.price) + sales_tax).round(2)

        total_tax    += sales_tax
        total_amount += payable

        csv << [product.quantity, product.product, ('%.02f' % payable)]
      end

      csv << [nil]

      csv << ["Sales Taxes: #{'%.02f' % total_tax}"]
      csv << ["Total: #{'%.02f' % total_amount}"]
    end

    @csv_file = csv_file
  end

  def calculate_tax(product)
    tax(product).sales_tax
  end

  def tax(product)
    Tax.new(product)
  end
end
