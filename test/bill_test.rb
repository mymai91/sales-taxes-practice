require_relative '../bills'
describe Bills do
  before do
    @bill = Bills.new(items)
  end

  let (:items) {
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
    it 'amount' do
      expect(@bill.total_sales_taxes).to eq(1.5)
    end
  end

  describe 'total' do
    it 'amount_with_sales_taxes' do
      expect(@bill.total_price).to eq(29.83)
    end
  end
end
