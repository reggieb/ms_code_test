module MsCodeTest
  class Product
    attr_accessor :name, :code, :price

    def initialize(name: nil, code: nil, price: nil)
      @name = name
      @code = code
      @price = price
    end
  end
end
