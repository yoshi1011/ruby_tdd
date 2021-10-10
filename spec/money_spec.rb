require_relative '../lib/dollar'
require_relative '../lib/franc'

# 前のコミットまではRSpecらしい階層を作っていたが、本誌に合わせるため、
# 階層をなくし、クラスごとにまとめていた書き方もやめて書き直した
RSpec.describe "MoneyTest" do
  it "test multiplication" do
    five = Money.dollar(5)
    # 第4章JUnitのassertEqualsのように別々のクラスインスタンスのID以外の
    # 同等性を測るメソッドはRubyには存在しないため、
    # timesで計算処理した結果のamountと同値性を期待する新規オブジェクトとを比較することとした。
    expect(five.times(2).amount).to eq Money.dollar(10).amount
    expect(five.times(3).amount).to eq Money.dollar(15).amount
    # テスト駆動開発本をRuby化している別のリポジトリでは「to eq」ではなく
    # 「==」で対応していたが、どのような値を入れてもテストが通ってしまうため
    # 解決策としては間違っていると考えられる
  end

  it "equality" do
    expect(Money.dollar(5).equals(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5).equals(Money.dollar(6))).to be_falsey
    expect(Money.franc(5).equals(Money.franc(5))).to be_truthy
    expect(Money.franc(5).equals(Money.franc(6))).to be_falsey
    expect(Money.dollar(5).equals(Money.franc(5))).to be_falsey
  end

  it "test franc multiplication" do
    five = Money.franc(5)
    expect(five.times(2).amount).to eq Money.franc(10).amount
    expect(five.times(3).amount).to eq Money.franc(15).amount
  end

  it "test currency" do
    expect(Money.dollar(1).currency).to eq "USD"
    expect(Money.franc(1).currency).to eq "CHF"
  end

  it "test different class equality" do
    expect(Money.new(10, "CHF").equals(Franc.new(10, "CHF"))).to be_truthy
  end
end
