class Product
  attr_reader :quantity, :product, :price

  def initialize(qty, product, price)
    @quantity = qty
    @product  = product
    @price    = BigDecimal.new(price, 4)
  end
end
