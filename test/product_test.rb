require_relative '../product'

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