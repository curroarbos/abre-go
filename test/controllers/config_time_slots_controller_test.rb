require "test_helper"

class ConfigTimeSlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get config_time_slots_new_url
    assert_response :success
  end

  test "should get create" do
    get config_time_slots_create_url
    assert_response :success
  end
end
