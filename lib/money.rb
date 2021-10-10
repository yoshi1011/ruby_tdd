require_relative './expression'

class Money
  include Expression
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
    Money.new(amount, "USD")
  end

  def self.franc(amount)
    Money.new(amount, "CHF")
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  def equals(money)
    amount == money.amount && currency == money.currency
  end

  def plus(addend)
    Money.new(amount + addend.amount, currency)
  end
end