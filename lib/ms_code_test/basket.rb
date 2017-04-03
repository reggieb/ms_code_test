module MsCodeTest
  class Basket
    attr_reader :product_types

    def initialize(product_types: [])
      @product_types = product_types
    end

    def total_for(*product_codes)
      products = product_codes.collect{|c| catalogue[c]}
      products.collect(&:price).inject(&:+)
    end

    def catalogue
      @catalogue ||= product_types.inject({}){|h,p| h[p.code] = p; h}
    end
  end
end
