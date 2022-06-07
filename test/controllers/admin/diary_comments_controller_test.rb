require "test_helper"

class Admin::DiaryCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_diary_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_diary_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_diary_comments_edit_url
    assert_response :success
  end
end
