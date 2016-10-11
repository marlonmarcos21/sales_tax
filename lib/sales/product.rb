class Product
  attr_reader :quantity, :product, :price

  def initialize(qty, product, price)
    @quantity = qty
    @product  = product
    @price    = price
  end
end
