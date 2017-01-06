class Tax
  class << self
    def calculate_tax(product)
      new(product).sales_tax
    end
  end

  attr_reader :product, :tax_rate

  def initialize(product)
    @product = product
    calculate_tax_rate
  end

  def sales_tax
    tax = round(product.price * tax_rate)
    tax * product.quantity
  end

  private

  def calculate_tax_rate
    item_name = product.product
    @tax_rate = if ['book', 'chocolate bar', 'packet of headache pills', 'imported box of chocolates'].include?(item_name)
                  0.0
                else
                  0.1
                end

    @tax_rate = BigDecimal.new(@tax_rate, 4)
    @tax_rate += 0.05 if item_name.include?('imported')
  end

  def round(x)
    (x * 20).ceil / 20.0
  end
end
