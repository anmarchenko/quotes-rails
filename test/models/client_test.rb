require "test_helper"

class ClientTest < ActiveSupport::TestCase
  def setup
    @client = Client.new(name: "Test Client")
  end

  test "should be valid" do
    assert @client.valid?
  end

  test "name should be present" do
    @client.name = "   "
    assert_not @client.valid?
  end

  test "name should be unique" do
    duplicate_client = @client.dup
    @client.save
    assert_not duplicate_client.valid?
  end

  test "should have many quotes" do
    assert_respond_to @client, :quotes
  end
end
