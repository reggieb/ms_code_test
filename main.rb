require_relative 'lib/ms_code_test'

module MsCodeTest
  jeans = Product.new(name: 'Jeans', code: 'J01', price: 32.95)
  blouse = Product.new(name: 'Blouse', code: 'B01', price: 24.95)
  socks = Product.new(name: 'Socks', code: 'S01', price: 7.95)

  special_offer = SpecialOffer.new(type: :buy_one_get_one_free, args: jeans.code)

  delivery_calculator = DeliveryCalculator.new(
    thresholds: {
      0 => 4.95,
      50 => 2.95,
      90 => 0
    }
  )

  def self.number_to_currency(number)
    "£#{"%0.2f" % number}"
  end

  basket = Basket.new(
    product_types: [jeans, blouse, socks],
    delivery_calculator: delivery_calculator,
    special_offer: special_offer
  )

  basket.add_product socks
  basket.add_product blouse

  puts "#{number_to_currency basket.total} should equal £37.85"

  basket = Basket.new(
    product_types: [jeans, blouse, socks],
    delivery_calculator: delivery_calculator,
    special_offer: special_offer
  )

  basket.add_product jeans
  basket.add_product jeans

  puts "#{number_to_currency basket.total} should equal £54.37"

  basket = Basket.new(
    product_types: [jeans, blouse, socks],
    delivery_calculator: delivery_calculator,
    special_offer: special_offer
  )

  basket.add_product jeans
  basket.add_product blouse

  puts "#{number_to_currency basket.total} should equal £60.85"

  basket = Basket.new(
    product_types: [jeans, blouse, socks],
    delivery_calculator: delivery_calculator,
    special_offer: special_offer
  )

  basket.add_product socks
  basket.add_product socks
  basket.add_product jeans
  basket.add_product jeans
  basket.add_product jeans

  puts "#{number_to_currency basket.total} should equal £98.27"
end
