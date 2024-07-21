require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  test "should not save compay without name" do
    company = build(:company, name: nil)
    assert_not company.save
  end

  test "should save company with valid attributes" do
    company = build(:company)
    assert company.save
  end
end
