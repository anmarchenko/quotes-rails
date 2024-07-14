require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "should not save quote without name" do
    quote = Quote.new
    assert_not quote.save
  end

  test "should save quote with name" do
    quote = Quote.new(name: "Test quote")
    assert quote.save
  end

  test "should broadcast to quotes" do
    quote = Quote.new(name: "Test quote")

    assert_turbo_stream_broadcasts("quotes", count: 1) do
      perform_enqueued_jobs do
        quote.save
      end
    end
  end

  test "should order quotes by newest" do
    quote1 = Quote.create(name: "First quote")
    quote2 = Quote.create(name: "Second quote")

    assert_equal [quote2, quote1], Quote.order_newest.limit(2)
  end
end
