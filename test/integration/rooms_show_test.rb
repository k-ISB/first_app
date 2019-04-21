require 'test_helper'

class RoomsShowTest < ActionDispatch::IntegrationTest    

  def setup
    @user = users(:michael)
  end

  test "should show chatroom with log in" do
    log_in_as(@user)
    get rooms_url
    assert_response :success
  end
end