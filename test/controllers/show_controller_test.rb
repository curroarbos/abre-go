require "test_helper"

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get show_new_url
    assert_response :success
  end

  test "should get create" do
    get show_create_url
    assert_response :success
  end
end
