require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "shows sign in link if there is no authenticated user" do
    get root_url

    assert_response :success

    assert_select "a", "Sign in"
  end

  test "shows quotes link and current user menu if there is an user" do
    sign_in_as(users(:lazaro_nixon))
    get root_url

    assert_response :success
    assert_select "a", "View quotes"
    assert_select "div#current_user_menu"
  end
end
