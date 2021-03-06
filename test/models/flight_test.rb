require 'test_helper'

class FlightTest < ActiveSupport::TestCase

  def setup
    @flight = flights(:one)
    @joseph = passengers(:joseph)
  end

  test "should be valid" do
    assert @flight.valid?
  end

  test "needs a departure airport" do
    @flight.departure_airport = nil
    assert_not @flight.valid?
  end

  test "needs an arrival airport" do
    @flight.arrival_airport = nil
    assert_not @flight.valid?
  end

  test "needs a flight number" do
    @flight.flight_number = nil
    assert_not @flight.valid?
  end

  test "needs a price" do
    @flight.price = nil
    assert_not @flight.valid?
  end

  test "needs a departure date" do
    @flight.departure_date = nil
    assert_not @flight.valid?
  end

  test "needs an arrival date" do
    @flight.arrival_date = nil
    assert_not @flight.valid?
  end

  test "booking adds passenger" do
    assert_difference '@flight.passengers.count', 1 do
      Booking.create(passenger: @joseph, flight: @flight)
    end
  end
end
