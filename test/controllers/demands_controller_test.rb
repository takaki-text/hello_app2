require 'test_helper'

class DemandsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get demands_new_url
    assert_response :success
  end

  test "should get index" do
    get demands_index_url
    assert_response :success
  end

  test "should get show" do
    get demands_show_url
    assert_response :success
  end

  test "should get create" do
    get demands_create_url
    assert_response :success
  end

  test "should get edit" do
    get demands_edit_url
    assert_response :success
  end

  test "should get update" do
    get demands_update_url
    assert_response :success
  end

  test "should get destroy" do
    get demands_destroy_url
    assert_response :success
  end

end
