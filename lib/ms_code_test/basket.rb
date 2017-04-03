module MsCodeTest
  class Basket
    attr_reader :product_types, :delivery_calculator

    def initialize(product_types: [], delivery_calculator: nil)
      @product_types = product_types
      @delivery_calculator = delivery_calculator
    end

    def total_for(*product_codes)
      products = product_codes.collect{|c| catalogue[c]}
      total = products.collect(&:price).inject(&:+)
      return total unless delivery_calculator
      total + delivery_calculator.cost_for(total)
    end

    def catalogue
      @catalogue ||= product_types.inject({}){|h,p| h[p.code] = p; h}
    end
  end
end
