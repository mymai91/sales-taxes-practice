require_relative 'bill_item'
require_relative 'category'
require_relative 'product'

class Bills

  def initialize(items)
    @items = items
  end

  def total_price
    _paying(@items, :_price_with_sales_taxes_item)
  end

  def total_sales_taxes
    _paying(@items, :_sales_taxes_item)
  end

  def print_bill
    @items.each do |item|
      if BillItem.new(item).bill_item?
        item = BillItem.new(item).item
        puts "#{ _quantity(item) }, #{ item[:product] }, #{ _price_with_sales_taxes_item(item) }"
      end
    end
  end

  private

  def _quantity(item)
    item[:quantity].to_i
  end

  def _paying(items, type_paying)
    total = 0
    items.each do |item|
      if BillItem.new(item).bill_item?
        item = BillItem.new(item).item
        price = send(type_paying, item)
        total += price
      end
    end
    total
  end

  def _price_with_sales_taxes_item(item)
    _quantity(item) * Product.new().price_with_sale_tax(item)
  end

  def _sales_taxes_item(item)
    _quantity(item) * Product.new().sale_tax(item)
  end

end
