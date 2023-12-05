require "test_helper"

class DayTimeSlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get day_time_slots_new_url
    assert_response :success
  end

  test "should get create" do
    get day_time_slots_create_url
    assert_response :success
  end
end
