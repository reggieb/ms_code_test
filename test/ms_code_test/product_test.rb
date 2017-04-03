require "test_helper"

module MsCodeTest
	class ProductTest < Minitest::Test

	  def test_name
	    assert_equal product_name, product.name
	  end

	  def test_code
	    assert_equal code, product.code
	  end

	  def test_price
	    assert_equal price, product.price
	  end

	  def product
      @product = Product.new(
        name: product_name,
        code: code,
        price: price
      )
	  end

	  def product_name
	    'Foo'
	  end

	  def code
	    'F01'
	  end

	  def price
	    1.10
	  end

	end
end
