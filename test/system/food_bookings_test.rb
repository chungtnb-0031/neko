require "application_system_test_case"

class FoodBookingsTest < ApplicationSystemTestCase
  setup do
    @food_booking = food_bookings(:one)
  end

  test "visiting the index" do
    visit food_bookings_url
    assert_selector "h1", text: "Food Bookings"
  end

  test "creating a Food booking" do
    visit food_bookings_url
    click_on "New Food Booking"

    fill_in "Food", with: @food_booking.food_id
    fill_in "Table booking", with: @food_booking.table_booking_id
    click_on "Create Food booking"

    assert_text "Food booking was successfully created"
    click_on "Back"
  end

  test "updating a Food booking" do
    visit food_bookings_url
    click_on "Edit", match: :first

    fill_in "Food", with: @food_booking.food_id
    fill_in "Table booking", with: @food_booking.table_booking_id
    click_on "Update Food booking"

    assert_text "Food booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Food booking" do
    visit food_bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food booking was successfully destroyed"
  end
end
