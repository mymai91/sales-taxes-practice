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