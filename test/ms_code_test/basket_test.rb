require "test_helper"

module MsCodeTest
  class BasketTest < Minitest::Test

    def test_total_for
      assert_equal (3), basket.total_for('X01')
      assert_equal (3 + 30), basket.total_for('X01', 'Y01')
      assert_equal (30 + 30), basket.total_for('Y01', 'Y01')
    end

    def test_total_for_with_delivery_costs
      basket = Basket.new(
        product_types: [product_one, product_two],
        delivery_calculator: delivery_calculator
      )
      assert_equal (3 + 7), basket.total_for('X01')
      assert_equal (3 + 30 + 2), basket.total_for('X01', 'Y01')
      assert_equal (30 + 30), basket.total_for('Y01', 'Y01')
    end

    def test_total_for_with_special_offer
      basket = Basket.new(
         product_types: [product_one, product_two],
         special_offer: special_offer
      )
      assert_equal (3), basket.total_for('X01')
      assert_equal (3 + 30), basket.total_for('X01', 'Y01')
      assert_equal (30 + 30 - 15), basket.total_for('Y01', 'Y01')
    end

    def test_total_for_with_delivery_costs_and_special_offer
      basket = Basket.new(
        product_types: [product_one, product_two],
        delivery_calculator: delivery_calculator,
        special_offer: special_offer
      )
      assert_equal (3 + 7), basket.total_for('X01')
      assert_equal (3 + 30 + 2), basket.total_for('X01', 'Y01')
      assert_equal (30 + 30 - 15), basket.total_for('Y01', 'Y01')
    end

    def test_add_product
      basket.add_product 'X01'
      assert_equal [product_one], basket.products
    end

    def test_total
      test_add_product
      assert_equal 3, basket.total
    end

    def basket
      @basket ||= Basket.new( product_types: [product_one, product_two] )
    end

    def delivery_calculator
      @delivery_calculator ||= DeliveryCalculator.new( thresholds: thresholds )
    end

    def thresholds
      {
      	0 => 7,
      	10 => 2,
      	40 => 0
      }
    end

    def special_offer
      @special_offer = SpecialOffer.new(
        type: :buy_one_get_one_free,
        args: product_two.code
      )
    end

    def products
      [product_one, product_two]
    end

    def product_one
      @product_one ||= Product.new(name: 'X', code: 'X01', price: 3)
    end

    def product_two
      @product_two ||= Product.new(name: 'Y', code: 'Y01', price: 30)
    end
  end
end
