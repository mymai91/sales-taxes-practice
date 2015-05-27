require_relative '../product'
require_relative '../tax_product'
require_relative '../bill'

describe Bill do
  before do
    @list_goods = Bill.new(list_goods)
  end

  let (:list_goods) {
    [
      { 
        quantity: "1",
        product: "story book",
        price: "12.49"
      },
      {
        quantity: "1",
        product: "chocolate bar",
        price: "0.85"
      },
      {
        quantity: "1",
        product: "music cd",
        price: "14.99"
      }
    ]
  }

  describe 'sales taxes' do
    it 'import product and duty product' do
      expect(@list_goods.sales_taxes).to eq(1.5)
    end
  end

  describe 'total' do
    it 'product has taxes' do
      expect(@list_goods.total_has_taxes).to eq(29.83)
    end
  end
end
