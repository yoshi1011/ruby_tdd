require_relative '../lib/dollar'
require_relative '../lib/franc'

# 前のコミットまではRSpecらしい階層を作っていたが、本誌に合わせるため、
# 階層をなくし、クラスごとにまとめていた書き方もやめて書き直した
RSpec.describe "MoneyTest" do
  it "test multiplication" do
    five = Dollar.new(5)
    # 第4章JUnitのassertEqualsのように別々のクラスインスタンスのID以外の
    # 同等性を測るメソッドはRubyには存在しないため、
    # timesで計算処理した結果のamountと同値性を期待する新規オブジェクトとを比較することとした。
    expect(five.times(2).amount).to eq Dollar.new(10).amount
    expect(five.times(3).amount).to eq Dollar.new(15).amount
    # テスト駆動開発本をRuby化している別のリポジトリでは「to eq」ではなく
    # 「==」で対応していたが、どのような値を入れてもテストが通ってしまうため
    # 解決策としては間違っていると考えられる
  end

  it "equality" do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equals(Dollar.new(6))).to be_falsey
    expect(Franc.new(5).equals(Franc.new(5))).to be_truthy
    expect(Franc.new(5).equals(Franc.new(6))).to be_falsey
    expect(Dollar.new(5).equals(Franc.new(5))).to be_falsey
  end

  it "test franc multiplication" do
    five = Franc.new(5)
    expect(five.times(2).amount).to eq Franc.new(10).amount
    expect(five.times(3).amount).to eq Franc.new(15).amount
  end
end
