require_relative '../lib/dollar'
require_relative '../lib/franc'

# DollarとFrancとでSpecファイルを分割することでdescribeの階層を減らすことができるが、
# 読みやすさ、学習のしやすさを考慮して本に記載のファイル名と同じにして進める
RSpec.describe "MoneyTest" do
  describe "Dollar" do
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

    describe "#equal" do
      it "$5のDollarインスタンス同士は等価である" do
        expect(Dollar.new(5).equals(Dollar.new(5))).to be_truthy
      end

      it "$5と$6のDollarインスタンスは等価でない" do
        expect(Dollar.new(5).equals(Dollar.new(6))).to be_falsey
      end
    end
  end

  describe "Franc" do
    it "test franc multiplication" do
      five = Franc.new(5)
      expect(five.times(2).amount).to eq Franc.new(10).amount
      expect(five.times(3).amount).to eq Franc.new(15).amount
    end

    describe "#equal" do
      it "5 CHFのFrancインスタンス同士は等価である" do
        expect(Franc.new(5).equals(Franc.new(5))).to be_truthy
      end

      it "5 CHFと6 CHFのFrancインスタンスは等価でない" do
        expect(Franc.new(5).equals(Franc.new(6))).to be_falsey
      end
    end
  end
end
