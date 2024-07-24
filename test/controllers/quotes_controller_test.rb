require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_as(users(:lazaro_nixon))
  end

  test "index lists all quotes" do
    get quotes_url

    assert_response :success
    assert_select "h2", count: Quote.count
  end

  test "index orders the newest quote first" do
    new_quote = create(:quote, name: "New quote")

    get quotes_url

    assert_response :success
    quotes = assert_select "h2"
    assert_equal new_quote.name, quotes.first.text.strip
  end

  test "show displays the quote" do
    quote = quotes(:first)
    get quote_url(quote)

    assert_response :success
    assert_select "h1", quote.name
  end

  test "create saves the quote" do
    assert_difference("Quote.count") do
      post quotes_url, params: {quote: {name: "New quote"}}
    end

    assert_redirected_to quotes_url
  end

  test "update modifies the quote" do
    quote = quotes(:first)
    patch quote_url(quote), params: {quote: {name: "Updated quote"}}

    assert_redirected_to quotes_url
    assert_equal "Updated quote", quote.reload.name
  end

  test "destroy removes the quote" do
    quote = quotes(:first)
    assert_difference("Quote.count", -1) do
      delete quote_url(quote)
    end

    assert_redirected_to quotes_url
  end
end
