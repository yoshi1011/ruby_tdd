require_relative '../lib/money'

RSpec.describe "MoneyTest" do
  it "test multiplication" do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq 10
    product = five.times(3)
    expect(product.amount).to eq 15
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
