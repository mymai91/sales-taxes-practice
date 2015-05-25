# class Goods

class Product
  attr_reader :goods

  def initialize(goods)
    @goods = goods
  end

  # check product
  # if miss one of them will return false
  # return boolean value

  def product?
    _check_quantity? && _check_product? && _check_price?
  end

  private

  # check miss value
  # return boolean value

  def _check_value(key, name)
    !!(@goods[key].public_send(name) > 0)
  end

  # check miss quantity
  # return boolean value

  def _check_quantity?
    _check_value(:quantity, :to_i)
  end

  # check miss product
  # return boolean value

  def _check_product?
    _check_value(:product, :length)
  end

  # check miss price
  # return boolean value

  def _check_price?
    _check_value(:price, :to_f)
  end

end

class TaxProduct
  
  attr_reader :goods

  EXTEMP_PRODUCT = %w(book chocolate pill chocolates books pills)
  IMPORTED_PRODUCT = %w(imported)

  def initialize(goods)
    @goods = goods
  end

  # Method calculate sales taxes
  # If produce is extemp produce will extemp tax
  # Else produce is duty produce will got 10%

  def sales_taxes
    _check_extemp_product(@goods) ? 0 : ((@goods[:price].to_f * 10 / 100) * @goods[:quantity].to_i).round(2)
  end

  # Method calculate import taxes
  # If produce is import produce will got 5%

  def import_taxes
    _check_imported_product(@goods) ? ((@goods[:price].to_f * 5 / 100) * @goods[:quantity].to_i).round(2) : 0
  end

  private

  # Method to check product
  # return a boolean value
  # name_of_product will return an array
  # ex goods[:product] = "chocolate bar well"
  # name_of_product = ["chocolate", "bar", "well"]
  # sum_name combine the name of EXTEMP_PRODUCT and name_of_product
  # select_name to get the uniq name

  def _check_product(type_product)
    name_of_product = goods[:product].split(" ")
    sum_name = type_product + name_of_product
    select_name = sum_name.uniq
    sum_name.length != select_name.length
  end

  # Method to check Is this duty product?
  # _check_extemp_product(goods)
  #
  # return true 
  # it mean: there are confict name in sum_name
  # this goods are an extemp product
  #
  # return false
  # it meand: there is not confict name in sum_name
  # this goods are a duty product

  def _check_extemp_product(goods)
    _check_product(EXTEMP_PRODUCT)
  end

  # Method to check Is this imported product?
  # _check_imported_product(goods)
  #
  # return true 
  # it mean: there are confict name in sum_name
  # this goods are an imported product
  #
  # return false
  # it meand: there is not confict name in sum_name
  # this goods is not a imported product

  def _check_imported_product(goods)
    _check_product(IMPORTED_PRODUCT)
  end
end

# Class Bill

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
