require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  
  def setup
    @booking = bookings(:one)
  end

  test "should be valid" do
    assert @booking.valid?
  end

  test "needs a flight" do
    @booking.flight = nil
    assert_not @booking.valid?
  end

  test "needs a passenger" do
    @booking.passenger = nil
    assert_not @booking.valid?
  end
end
