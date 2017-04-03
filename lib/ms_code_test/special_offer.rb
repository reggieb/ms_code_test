module MsCodeTest
  class SpecialOffer
    attr_reader :type, :args

    # type: an instance method of this class
    # args: arguments passed to the instance method on calling
    def initialize(type: nil, args: [])
      @type = type
      @args = args
    end

    # Using send to allow additional offer methods to be added later,
    # and to make the reduction type clear from the SpecialOffer initialization.
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
