require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_as(users(:lazaro_nixon))
  end

  test "should get edit" do
    get edit_password_url
    assert_response :success
  end

  test "should update password" do
    patch password_url, params: {user: {password_challenge: "Secret1*3*5*", password: "Secret6*4*2*", password_confirmation: "Secret6*4*2*"}}
    assert_redirected_to root_url
  end

  test "should not update password with wrong password challenge" do
    patch password_url, params: {user: {password_challenge: "SecretWrong1*3", password: "Secret6*4*2*", password_confirmation: "Secret6*4*2*"}}

    assert_response :unprocessable_entity
    assert_select "div.text-red-500", /is invalid/
  end

  test "should not update password with wrong password confirmation" do
    patch password_url, params: {user: {password_challenge: "Secret1*3*5*", password: "Secret6*4*2*", password_confirmation: "Secret6*4*1*"}}

    assert_response :unprocessable_entity
    assert_select "div.text-red-500", /doesn't match/
  end
end
