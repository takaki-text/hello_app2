require 'test_helper'

class TravelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get travels_show_url
    assert_response :success
  end

end
