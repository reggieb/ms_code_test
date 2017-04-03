

module MsCodeTest
  class SpecialOfferTest < Minitest::Test

    def test_reduction
      assert_equal 0, special_offer.reduction(product_one)
    end

    def test_reduction_when_two_products
      expected = product_one.price * 0.5
      assert_equal expected, special_offer.reduction(product_one, product_one)
    end

    def test_reduction_when_three_products
      expected = product_one.price * 0.5
      assert_equal expected, special_offer.reduction(product_one, product_one, product_one)
    end

    def test_reduction_when_four_products
      expected = product_one.price * (0.5 + 0.5)
      assert_equal expected, special_offer.reduction(product_one, product_one, product_one, product_one)
    end

    def test_reduction_reduction_other_products
      expected = 0
      assert_equal expected, special_offer.reduction(product_two, product_two)
    end

    def test_reduction_reduction_variety_of_products
      expected = product_one.price * 0.5
      assert_equal expected, special_offer.reduction(product_one, product_one, product_two, product_two)
    end

    def special_offer
      @special_offer = SpecialOffer.new(
        type: :buy_one_get_one_free,
        args: product_one.code
      )
    end

    def product_one
      @product_one ||= Product.new(name: 'X', code: 'X01', price: 3)
    end

    def product_two
      @product_two ||= Product.new(name: 'Y', code: 'Y01', price: 30)
    end
  end
end
