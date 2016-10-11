## README

* Clone

```
git clone https://github.com/marlonmarcos21/sales_tax.git
```

* Execute bundle install

```
bundle install
```

* Sample Usage

```
require '[/path/to]/sales_tax'

product1 = Product.new(1, 'book', 12.49)
product2 = Product.new(1, 'music CD', 14.99)
product3 = Product.new(1, 'chocolate bar', 0.85)

# generate the invoice, invoices will be saved in invoices folder
Invoice.new(product1, product2, product3)
```

* Run tests

```
bundle exec rspec
```
