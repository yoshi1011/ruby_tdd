class Money
  # 第4章でamountをprivate化しているが、同一クラスであれば別インスタンスの
  # pivateフィールドにアクセスできるJavaのような仕様はないためprivate化しない
  # また、同様の理由でprotectedも使用しない
  attr_accessor :amount
  attr_reader   :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def self.dollar(amount)
    Dollar.new(amount, "USD")
  end

  def self.franc(amount)
    Franc.new(amount, "CHF")
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  def equals(money)
    amount == money.amount && currency == money.currency
  end
end