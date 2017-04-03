require "test_helper"

module MsCodeTest
	class DeliveryCalculatorTest < Minitest::Test

		def test_cost_for
      assert_equal thresholds[0], delivery_calculator.cost_for(1)
      assert_equal thresholds[50], delivery_calculator.cost_for(51)
      assert_equal thresholds[90], delivery_calculator.cost_for(91)
		end

    def delivery_calculator
      @delivery_calculator ||= DeliveryCalculator.new( thresholds: thresholds )
    end

    def thresholds
      {
      	0 => 4.95,
      	50 => 2.95,
      	90 => 0
      }
    end

  end
end
