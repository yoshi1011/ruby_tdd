require_relative '../lib/money'

RSpec.describe "MoneyTest" do
  it "test multiplication" do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq 10
    product = five.times(3)
    expect(product.amount).to eq 15
  end
end
