require 'test_helper'

class ContestantTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contestant_team = contestant_teams(:one)
  end

  test "should get index" do
    get contestant_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_contestant_team_url
    assert_response :success
  end

  test "should create contestant_team" do
    assert_difference('ContestantTeam.count') do
      post contestant_teams_url, params: { contestant_team: { game_id: @contestant_team.game_id, score: @contestant_team.score, team_id: @contestant_team.team_id } }
    end

    assert_redirected_to contestant_team_url(ContestantTeam.last)
  end

  test "should show contestant_team" do
    get contestant_team_url(@contestant_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_contestant_team_url(@contestant_team)
    assert_response :success
  end

  test "should update contestant_team" do
    patch contestant_team_url(@contestant_team), params: { contestant_team: { game_id: @contestant_team.game_id, score: @contestant_team.score, team_id: @contestant_team.team_id } }
    assert_redirected_to contestant_team_url(@contestant_team)
  end

  test "should destroy contestant_team" do
    assert_difference('ContestantTeam.count', -1) do
      delete contestant_team_url(@contestant_team)
    end

    assert_redirected_to contestant_teams_url
  end
end
