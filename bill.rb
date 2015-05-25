require_relative 'product'
require_relative 'tax_product'

class Bill < TaxProduct

  attr_reader :list_goods

  def initialize(list_goods)
    @list_goods = list_goods
  end

  # total price has taxes
  # price_product_has_taxes = price product * quanity + duty_tax + import_tax
  # return number

  def total_has_taxes
    sum = 0
    @list_goods.each do |goods|
      if Product.new(goods).product?
        item = TaxProduct.new(goods)
        price_duty = item.sales_taxes || 0
        price_import = item.import_taxes || 0
        price_product_has_taxes = ((goods[:price].to_f * goods[:quantity].to_i) + price_duty + price_import).round(2)
        puts "#{goods[:quantity]}, #{goods[:product]}, #{price_product_has_taxes}"
        sum += price_product_has_taxes
      end
    end
    puts "Total: #{sum.round(2)}"
    sum.round(2)
  end

  # total price has taxes
  # price_product_has_taxes = price product * quanity
  # return number

  def total_has_not_taxes
    sum = 0
    @list_goods.each do |goods|
      if Product.new(goods).product?
        price = goods[:price].to_f * goods[:quantity].to_i
        sum += price
      end
    end
    sum.round(2)
  end

  # sales taxes
  # sales_taxes = total_has_taxes - total_has_not_taxes
  # return number

  def sales_taxes
    sales_taxes = (total_has_taxes - total_has_not_taxes).round(2)
    puts "Sales Taxes: #{sales_taxes}"
    sales_taxes
  end
end