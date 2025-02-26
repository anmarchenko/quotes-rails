require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  test "#total_price returns the total price of the line item" do
    assert_equal 250, line_items(:catering_today).total_price
  end

  test "should not save line item without quaintut" do
    line_item = line_items(:catering_today)
    line_item.quantity = nil
    assert_not line_item.save
  end

  test "should not save line item without unit price" do
    line_item = line_items(:catering_today)
    line_item.unit_price = nil
    assert_not line_item.save
  end

  test "should not save line item with quantity less than 1" do
    line_item = line_items(:catering_today)
    line_item.quantity = 0
    assert_not line_item.save
  end

  test "should not save line item with unit price less than 1" do
    line_item = line_items(:catering_today)
    line_item.unit_price = 0
    assert_not line_item.save
  end

  test "should save line item with valid attributes" do
    line_item = line_items(:catering_today)
    assert line_item.save
  end

  test "should not save line item without name" do
    line_item = line_items(:catering_today)
    line_item.name = nil
    assert_not line_item.save
  end
end
