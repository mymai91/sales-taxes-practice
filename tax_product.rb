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
  #
  # @return a boolean value
  # 
  # name_of_product will return an array
  # 
  # @example
  # goods[:product] = "chocolate bar well"
  # name_of_product will be ["chocolate", "bar", "well"]
  # 
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
  # @return true 
  #
  # It mean: there are confict name in sum_name
  # This goods are an extemp product
  #
  # @return false
  #
  # It mean: there is not confict name in sum_name
  # This goods are a duty product
  def _check_extemp_product(goods)
    _check_product(EXTEMP_PRODUCT)
  end

  # Method to check Is this imported product?
  # _check_imported_product(goods)
  #
  # @return true 
  #
  # It mean: there are confict name in sum_name
  # This goods are an imported product
  #
  # @return false
  #
  # It mean: there is not confict name in sum_name
  # This goods is not a imported product
  def _check_imported_product(goods)
    _check_product(IMPORTED_PRODUCT)
  end
end
