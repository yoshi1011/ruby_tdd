class Franc
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end

  def equals(object)
    franc = object
    amount == franc.amount
  end
end