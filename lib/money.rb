class Money
  # 第4章でamountをprivate化しているが、同一クラスであれば別インスタンスの
  # pivateフィールドにアクセスできるJavaのような仕様はないためprivate化しない
  # また、同様の理由でprotectedも使用しない
  attr_accessor :amount

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end

  # Rubyにはabstractオプションが存在しないため、エラーを呼ぶメソッドを定義し、
  # オーバーライドしなければ呼び出されるように設計した
  def times(multiplier)
    undefined_times_method
  end

  def undefined_times_method
    raise "'times' method is not overridde."
  end

  def equals(money)
    amount == money.amount && self.class == money.class
  end
end