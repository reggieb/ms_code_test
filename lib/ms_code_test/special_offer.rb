

module MsCodeTest
  class SpecialOffer
    attr_reader :type, :args

    def initialize(type: nil, args: [])
      @type = type
      @args = args
    end

    def reduction(*products)
      send type, products, args
    end

    def buy_one_get_one_free(products, product_code)
      products.select!{|p| p.code == product_code}
      return 0 if products.empty?
      number_of_pairs = products.size / 2
      number_of_pairs * 0.5 * products.first.price
    end
  end
end
