require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "should get show and with not logged in" do
    get rooms_show_url
    assert_redirected_to login_url
    log_in_as(@user)
    get rooms_show_url
    assert_response :success
  end
end
 
