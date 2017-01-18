require 'test_helper'

class TeamPlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_players_index_url
    assert_response :success
  end

  test "should get show" do
    get team_players_show_url
    assert_response :success
  end

  test "should get update" do
    get team_players_update_url
    assert_response :success
  end

  test "should get edit" do
    get team_players_edit_url
    assert_response :success
  end

  test "should get new" do
    get team_players_new_url
    assert_response :success
  end

  test "should get delete" do
    get team_players_delete_url
    assert_response :success
  end

  test "should get create" do
    get team_players_create_url
    assert_response :success
  end

end
