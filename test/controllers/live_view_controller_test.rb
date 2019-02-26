require 'test_helper'

class LiveViewControllerTest < ActionDispatch::IntegrationTest
  test "should get single_game" do
    get live_view_single_game_url
    assert_response :success
  end

end
