require 'test_helper'

class DirectivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get directives_index_url
    assert_response :success
  end

  test "should get new" do
    get directives_new_url
    assert_response :success
  end

  test "should get show" do
    get directives_show_url
    assert_response :success
  end

  test "should get update" do
    get directives_update_url
    assert_response :success
  end

  test "should get destroy" do
    get directives_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get directives_edit_url
    assert_response :success
  end

  test "should get create" do
    get directives_create_url
    assert_response :success
  end

end
