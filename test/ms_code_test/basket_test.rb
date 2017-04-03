require "test_helper"

module MsCodeTest
  class BasketTest < Minitest::Test

    def test_total_for
      basket = Basket.new(
        product_types: [product_one, product_two]
      )
      assert_equal (2.5 + 30), basket.total_for('X01', 'Y01')
      assert_equal (30 + 30), basket.total_for('Y01', 'Y01')
      assert_equal (2.5), basket.total_for('X01')
    end

    def products
      [product_one, product_two]
    end

    def product_one
      @product_one ||= Product.new(name: 'X', code: 'X01', price: 2.5)
    end

    def product_two
      @product_two ||= Product.new(name: 'Y', code: 'Y01', price: 30)
    end
  end
end
