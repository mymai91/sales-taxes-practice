require_relative '../tax_product'

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