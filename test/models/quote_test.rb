require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "should not save quote without name" do
    quote = build(:quote, name: nil)
    assert_not quote.save
  end

  test "should save quote with name and company" do
    quote = build(:quote)
    assert quote.save
  end

  test "should broadcast to quotes" do
    quote = build(:quote)

    assert_turbo_stream_broadcasts([quote.company, "quotes"], count: 1) do
      perform_enqueued_jobs do
        quote.save
      end
    end
  end

  test "should order quotes by newest" do
    quote1 = create(:quote, name: "First quote")
    quote2 = create(:quote, name: "Second quote")

    assert_equal [quote2, quote1], Quote.order_newest.limit(2)
  end
end
