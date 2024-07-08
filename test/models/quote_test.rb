require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "should not save quote without name" do
    quote = Quote.new
    assert_not quote.save
  end

  test "should save quote with name" do
    quote = Quote.new(name: "Test quote")
    assert quote.save
  end
end
