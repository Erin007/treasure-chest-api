require 'test_helper'

class HuntsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hunts_index_url
    assert_response :success
  end

  test "should get new" do
    get hunts_new_url
    assert_response :success
  end

  test "should get show" do
    get hunts_show_url
    assert_response :success
  end

  test "should get update" do
    get hunts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hunts_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get hunts_edit_url
    assert_response :success
  end

  test "should get create" do
    get hunts_create_url
    assert_response :success
  end

end
