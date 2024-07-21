require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @user = sign_in_as(users(:lazaro_nixon))
    @quote = Quote.order_newest.first # Reference to the first fixture quote
  end

  test "Creating a new quote" do
    # quotes list
    visit quotes_url
    assert_selector "h1", text: "My quotes"

    # open form to add a new quote
    click_on "New quote"
    fill_in "Name", with: "Capybara quote"

    click_on "Save"

    assert_selector "h1", text: "My quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "My quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    click_on "Save"

    assert_selector "h1", text: "My quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
