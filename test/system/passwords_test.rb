require "application_system_test_case"

class PasswordsTest < ApplicationSystemTestCase
  setup do
    @user = sign_in_as(users(:lazaro_nixon))
  end

  test "updating the password" do
    open_current_user_menu
    click_on "Change password"

    fill_in "Enter your current password", with: "Secret1*3*5*"
    fill_in "New password", with: "Secret6*4*2*"
    fill_in "Confirm new password", with: "Secret6*4*2*"
    click_on "Save changes"

    assert_text "Your password has been changed"
  end
end
