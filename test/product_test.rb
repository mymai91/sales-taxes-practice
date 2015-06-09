require_relative '../bill_item'
require_relative '../category'
require_relative '../product'
require 'byebug'

describe Product do

  let(:normal_item)   { { quantity: "1", product: "music cd", price: "14.99" } }
  let(:imported_item) { { quantity: "1", product: "imported music cd", price: "10" } }
  let(:imported_food_item) { { quantity: "1", product: "imported chocolate", price: "15" } }
  let(:medicine_item) { { quantity: "1", product: "pill", price: "12" } }

  it 'imported' do
    item = BillItem.new(imported_item).item

    expect(Product.imported?(item)).to be true
  end

  it 'price only with good tax' do
    item = BillItem.new(normal_item).item
    expect(Product.new().price_with_sale_tax(item)).to equal 16.49
  end

  it 'price with good tax and imported tax' do
    item = BillItem.new(imported_item).item
    expect(Product.new().price_with_sale_tax(item)).to equal 11.5
  end

  it 'price only with imported tax' do
    item = BillItem.new(imported_food_item).item
    expect(Product.new().price_with_sale_tax(item)).to equal 15.75
  end

  it 'does not have any kind of tax' do
    item = BillItem.new(medicine_item).item
    expect(Product.new().price_with_sale_tax(item)).to equal 12.00
  end
end
