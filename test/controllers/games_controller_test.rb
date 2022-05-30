require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get start_game" do
    get games_start_game_url
    assert_response :success
  end

  test "should get is_ready" do
    get games_is_ready_url
    assert_response :success
  end
end
