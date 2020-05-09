require 'test_helper'

class FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get follows_new_url
    assert_response :success
  end

  test "should get index" do
    get follows_index_url
    assert_response :success
  end

  test "should get show" do
    get follows_show_url
    assert_response :success
  end

  test "should get create" do
    get follows_create_url
    assert_response :success
  end

end
