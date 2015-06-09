require_relative 'bills'

input1 = [
  {
    quantity: "1",
    product: "story book",
    price: "12.49"
  },
  {
    quantity: "1",
    product: "music cd",
    price: "14.99"
  },
  {
    quantity: "1",
    product: "chocolate bar",
    price: "0.85"
  }
]

input2 = [
  {
    quantity: "1",
    product: "imported box of chocolates",
    price: "10.00"
  },
  {
    quantity: "1",
    product: "imported bottle of perfume",
    price: "47.50"
  }
]

input3 = [
  {
    quantity: "1",
    product: "imported bottle of perfume",
    price: "27.99"
  },
  {
    quantity: "1",
    product: "bottle of perfume",
    price: "18.99"
  },
  {
    quantity: "1",
    product: "packet of headache pills",
    price: "9.75"
  },
  {
    quantity: "1",
    product: "box of imported chocolates",
    price: "11.25"
  }
]

bills1 = Bills.new(input1)

bills1.print_bill
puts "Sales Taxes: #{ bills1.total_sales_taxes } "
puts "Total: #{ bills1.total_price } "

puts "=============================================="

bills2 = Bills.new(input2)

bills2.print_bill
puts "Sales Taxes: #{ bills2.total_sales_taxes } "
puts "Total: #{ bills2.total_price } "

puts "=============================================="

bills3 = Bills.new(input3)

bills3.print_bill
puts "Sales Taxes: #{ bills3.total_sales_taxes } "
puts "Total: #{ bills3.total_price } "
