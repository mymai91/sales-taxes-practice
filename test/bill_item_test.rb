require_relative '../bill_item'

describe BillItem do

  describe 'bill item' do
    let(:right_item) { { quantity: "1", product: "chocolate", price: "10" } }
    let(:wrong_quantity_item) { { quantity: "0", product: "chocolate", price: "10" } }
    let(:wrong_product_item) { { quantity: "1", product: "", price: "10" } }
    let(:wrong_price_item) { { quantity: "1", product: "chocolate", price: "-10" } }

    it 'This is bill item' do
      item = BillItem.new(right_item).bill_item?

      expect(item).to be true
    end

    it 'This is not bill item' do
      wrong_quantity = BillItem.new(wrong_quantity_item).bill_item?
      wrong_product = BillItem.new(wrong_product_item).bill_item?
      wrong_price = BillItem.new(wrong_price_item).bill_item?

      expect(wrong_quantity).to be false
      expect(wrong_product).to be false
      expect(wrong_price).to be false
    end
  end
end
