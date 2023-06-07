require "test_helper"

class UserCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_categories_new_url
    assert_response :success
  end
end
