require "application_system_test_case"

class TableBookingsTest < ApplicationSystemTestCase
  setup do
    @table_booking = table_bookings(:one)
  end

  test "visiting the index" do
    visit table_bookings_url
    assert_selector "h1", text: "Table Bookings"
  end

  test "creating a Table booking" do
    visit table_bookings_url
    click_on "New Table Booking"

    fill_in "Arrive time", with: @table_booking.arrive_time
    fill_in "Cat", with: @table_booking.cat_id
    fill_in "Discount", with: @table_booking.discount
    fill_in "Payment time", with: @table_booking.payment_time
    fill_in "User", with: @table_booking.user_id
    click_on "Create Table booking"

    assert_text "Table booking was successfully created"
    click_on "Back"
  end

  test "updating a Table booking" do
    visit table_bookings_url
    click_on "Edit", match: :first

    fill_in "Arrive time", with: @table_booking.arrive_time
    fill_in "Cat", with: @table_booking.cat_id
    fill_in "Discount", with: @table_booking.discount
    fill_in "Payment time", with: @table_booking.payment_time
    fill_in "User", with: @table_booking.user_id
    click_on "Update Table booking"

    assert_text "Table booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Table booking" do
    visit table_bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Table booking was successfully destroyed"
  end
end
