# Check product's Category
#
# There are 2 kind of product:
# extemp_product
# duty_product

class Category

  EXTEMP_PRODUCT = %w(book chocolate pill chocolates books pills)

  # method check duty product or extemp product
  #
  # @return a boolean value
  #
  # @return true if duty product
  #
  # @return false if extemp product
  def self.extemp_product?(item)
    product = item[:product].split(" ")
    combine_product = (EXTEMP_PRODUCT + product)
    filter_product = combine_product.uniq
    combine_product.length != filter_product.length
  end

end
