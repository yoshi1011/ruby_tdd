require_relative '../lib/money'

RSpec.describe "MoneyTest" do
  it "test multiplication" do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq 10
  end
end
