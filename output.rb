require_relative 'bill'

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

input1 = Bill.new(input1)
input1.sales_taxes

puts "=============================================="

input2 = Bill.new(input2)
input2.sales_taxes

puts "=============================================="

input3 = Bill.new(input3)
input3.sales_taxes
