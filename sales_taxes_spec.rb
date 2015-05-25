require_relative 'sales_taxes'

describe Product do

  describe 'suficent value' do

    let (:good_product) { {
    quantity: "1",
    product: "chocolate bar",
    price: "0.85"
  } }

    it 'suficent quantity, products, price' do
      goods = Product.new(good_product)
      expect(goods.product?).to be true
    end
  end

  describe 'miss value' do

    let (:product_miss_quantity) { { quantity: "", product: "music cd", price: "14.99" } }
    let (:product_miss_product)  { { quantity: "1", product: "", price: "12.49" } }
    let (:product_miss_price)    { { quantity: "1", product: "chocolate bar", price: "-19.55" } }
 
    it 'miss quantity or quantity < 1' do
      goods = Product.new(product_miss_quantity)
      expect(goods.product?).to be false
    end

    it 'miss products' do
      goods = Product.new(product_miss_product)
      expect(goods.product?).to be false
    end

    it 'miss price or is negative price' do
      goods = Product.new(product_miss_price)
      expect(goods.product?).to be false
    end
  end
end

describe 'Taxes' do
  describe 'Sales taxes products' do
    describe 'Duty products' do

      let (:goods) { { quantity: "1", product: "music cd", price: "14.99" } } 

      it 'has 10% sales tax' do
        basic_goods = TaxProduct.new(goods)
        expect(basic_goods.sales_taxes).to eq(1.5)
      end
    end

    describe 'Exempt products' do

      let (:music_cd)  { { quantity: "1", product: "music cd", price: "14.99" } }
      let (:book)      { { quantity: "1", product: 'story book', price: '12.49' } }
      let (:chocolate) { { quantity: "1", product: 'chocolate bar', price: '0.85' } }
      let (:pill)      { { quantity: "1", product: 'pill', price: '9.75' } }

      it 'has not sales tax' do
        book_product      = TaxProduct.new(book)
        chocolate_product = TaxProduct.new(chocolate)
        pill_product      = TaxProduct.new(pill)

        expect(book_product.sales_taxes).to eq(0)
        expect(chocolate_product.sales_taxes).to eq(0)
        expect(pill_product.sales_taxes).to eq(0)
      end
    end
  end

  describe 'Import taxes products' do
    describe 'Import duty products' do

      let (:pill) { { quantity: "1", product: 'imported pills', price: '9.75' } }

      it 'has 5% sales tax' do
        pill_product = TaxProduct.new(pill)
        expect(pill_product.import_taxes).to eq(0.49)
      end
    end
  end
end

describe Bill do
  before do
    @list_goods = Bill.new(list_goods)
  end

  let (:list_goods) {
    [
      { quantity: "1", product: "story book", price: "12.49" },
      { quantity: "1", product: "chocolate bar", price: "0.85" },
      { quantity: "1", product: "music cd", price: "14.99" }
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
