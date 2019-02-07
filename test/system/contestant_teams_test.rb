require "application_system_test_case"

class ContestantTeamsTest < ApplicationSystemTestCase
  setup do
    @contestant_team = contestant_teams(:one)
  end

  test "visiting the index" do
    visit contestant_teams_url
    assert_selector "h1", text: "Contestant Teams"
  end

  test "creating a Contestant team" do
    visit contestant_teams_url
    click_on "New Contestant Team"

    fill_in "Game", with: @contestant_team.game_id
    fill_in "Score", with: @contestant_team.score
    fill_in "Team", with: @contestant_team.team_id
    click_on "Create Contestant team"

    assert_text "Contestant team was successfully created"
    click_on "Back"
  end

  test "updating a Contestant team" do
    visit contestant_teams_url
    click_on "Edit", match: :first

    fill_in "Game", with: @contestant_team.game_id
    fill_in "Score", with: @contestant_team.score
    fill_in "Team", with: @contestant_team.team_id
    click_on "Update Contestant team"

    assert_text "Contestant team was successfully updated"
    click_on "Back"
  end

  test "destroying a Contestant team" do
    visit contestant_teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contestant team was successfully destroyed"
  end
end
