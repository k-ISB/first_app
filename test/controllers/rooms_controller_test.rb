require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "should get show and with not logged in" do
    get rooms_url
    assert_redirected_to login_url
  end
end
 
