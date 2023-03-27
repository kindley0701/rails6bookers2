require "test_helper"

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get notices_new_url
    assert_response :success
  end

  test "should get complete" do
    get notices_complete_url
    assert_response :success
  end
end
