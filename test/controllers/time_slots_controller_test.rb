require "test_helper"

class TimeSlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get time_slots_create_url
    assert_response :success
  end
end
