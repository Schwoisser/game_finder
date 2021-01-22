require "test_helper"

class ArmiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get armies_index_url
    assert_response :success
  end

  test "should get show" do
    get armies_show_url
    assert_response :success
  end

  test "should get edit" do
    get armies_edit_url
    assert_response :success
  end
end
