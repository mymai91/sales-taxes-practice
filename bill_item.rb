# Check BillItem valid?
#
# Case error
# quantity <= 0
# product is empty
# price <= 0
# If one of them is error then bill_item is not valid

class BillItem
  attr_reader :item
  def initialize(item)
    @item = item
  end

  def bill_item?
    _check_quantity? && _check_product? && _check_price?
  end

  private

  def _value(key, method)
    !!(@item[key].public_send(method) > 0)
  end

  def _check_quantity?
    _value(:quantity, :to_i)
  end

  def _check_product?
    _value(:product, :length)
  end

  def _check_price?
    _value(:price, :to_f)
  end
end
