require "test_helper"

class PlayerGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get player_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get player_groups_show_url
    assert_response :success
  end

  test "should get edit" do
    get player_groups_edit_url
    assert_response :success
  end

  test "should get update" do
    get player_groups_update_url
    assert_response :success
  end

  test "should get delete" do
    get player_groups_delete_url
    assert_response :success
  end
end
