require_relative '../bill_item'
require_relative '../category'

describe Category do

  describe 'category' do
    let(:normal_item)   { { quantity: "1", product: "music cd", price: "10" } }
    let(:food_item)     { { quantity: "1", product: "chocolate", price: "15" } }
    let(:medicine_item) { { quantity: "1", product: "pill", price: "12" } }
    let(:book_item)     { { quantity: "1", product: "book", price: "10" } }

    it 'with sales tax' do
      item = BillItem.new(normal_item).item

      expect(Category.extemp_product?(item)).to be false
    end

    it 'without sales tax' do
      food     = BillItem.new(food_item).item
      medicine = BillItem.new(medicine_item).item
      book     = BillItem.new(book_item).item

      expect(Category.extemp_product?(food)).to be true
      expect(Category.extemp_product?(medicine)).to be true
      expect(Category.extemp_product?(book)).to be true
    end
  end
end
