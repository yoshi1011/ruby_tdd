class Dollar
  # 第4章でamountをprivate化しているが、同一クラスであれば別インスタンスの
  # pivateフィールドにアクセスできるJavaのような仕様はないためprivate化しない
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def equals(object)
    dollar = object
    amount == dollar.amount
  end
end