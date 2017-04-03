require 'bigdecimal'
module MsCodeTest
  class Basket
    attr_reader :product_types, :delivery_calculator, :special_offer

    def initialize(product_types: [], delivery_calculator: nil, special_offer: nil)
      @product_types = product_types
      @delivery_calculator = delivery_calculator
      @special_offer = special_offer
    end

    def catalogue
      @catalogue ||= product_types.inject({}){|h, product| h[product.code] = product; h}
    end

    def products
      @products ||= []
    end

    def add_product(product_code)
      products << (product_code.kind_of?(Product) ? product_code : catalogue[product_code])
    end

    def total_for(*product_codes)
      total_for_products product_codes.collect{|c| catalogue[c]}
    end

    def total_for_products(products = [])
      total = products.collect(&:price).inject(&:+)
      total = total - special_offer.reduction(*products) if special_offer
      return total unless delivery_calculator
      total + delivery_calculator.cost_for(total)
    end

    def total
      # Manipulation to ensure results are displayed as valid prices
      # TODO - Determine if inputs can be decimal inputs and output currency formatted
      #        easily via methods available in environment (as they would be within Rails)
      BigDecimal.new((total_for_products(products) * 100).floor) * 0.01
    end
  end
end
