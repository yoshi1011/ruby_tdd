class Money
  # 第4章でamountをprivate化しているが、同一クラスであれば別インスタンスの
  # pivateフィールドにアクセスできるJavaのような仕様はないためprivate化しない
  # また、同様の理由でprotectedも使用しない
  attr_accessor :amount

  def equals(money)
    amount == money.amount && self.class == money.class
  end
end