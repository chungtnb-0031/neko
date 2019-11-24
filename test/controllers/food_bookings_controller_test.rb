require 'test_helper'

class FoodBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get food_bookings_create_url
    assert_response :success
  end

  test "should get update" do
    get food_bookings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get food_bookings_destroy_url
    assert_response :success
  end

end
