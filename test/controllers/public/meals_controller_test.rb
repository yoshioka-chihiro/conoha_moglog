require "test_helper"

class Public::MealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_meals_index_url
    assert_response :success
  end

  test "should get show" do
    get public_meals_show_url
    assert_response :success
  end
end
