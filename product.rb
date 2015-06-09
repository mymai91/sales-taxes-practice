# Info's product
#
# Including info about:
# sale_tax consist import tax and good tax
# price
# price_with_sale_tax

class Product

  IMPORTED_PRODUCT = %w(imported)

  def self.imported?(item)
    product = item[:product].split(" ")
    combine_product = (IMPORTED_PRODUCT + product)
    filter_product = combine_product.uniq
    combine_product.length != filter_product.length
  end

  def sale_tax(item)
    (_good_tax(item) + _imported_tax(item)).to_f.round(2)
  end

  def price(item)
    item[:price].to_f.round(2)
  end

  def price_with_sale_tax(item)
    (price(item) + sale_tax(item)).round(2)
  end

  private

  def _amount_tax(item, percent)
    price(item) * percent
  end

  # If item belong duty product will get 10% on a good
  def _good_tax(item)
    !Category.extemp_product?(item) ? _amount_tax(item, 0.1) : 0
  end

  # If item belong imported product will get 5% on a good
  def _imported_tax(item)
    Product.imported?(item) ? _amount_tax(item, 0.05) : 0
  end
end
