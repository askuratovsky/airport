require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get board" do
    get main_board_url
    assert_response :success
  end

end
