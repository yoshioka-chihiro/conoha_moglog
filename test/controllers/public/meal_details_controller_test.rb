require "test_helper"

class Public::MealDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_meal_details_show_url
    assert_response :success
  end
end
