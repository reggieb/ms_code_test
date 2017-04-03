
class DeliveryCalculator
  attr_reader :thresholds

  def initialize(thresholds: {})
    @thresholds = thresholds
  end

  def cost_for(value)
    thresholds[ key_for_largest_threshold_less_than(value) ]
  end

  def key_for_largest_threshold_less_than(value)
    thresholds.keys.select{|k| k < value}.max
  end
end
