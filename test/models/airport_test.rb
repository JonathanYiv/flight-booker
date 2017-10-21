require 'test_helper'

class AirportTest < ActiveSupport::TestCase

  def setup
    @departure_airport = airports(:one)
    @arrival_airport = airports(:two)
    @flight_to_cancel = flights(:two)
  end

  test "should be valid" do
    assert @departure_airport.valid?
  end

  test "name should be present" do
    @departure_airport.name = nil
    assert_not @departure_airport.valid?
  end

  test "abbreviation should be present" do
    @departure_airport.abbreviation = nil
    assert_not @departure_airport.valid?
  end

  test "airport has departing flights associated" do
    assert_difference '@departure_airport.departing_flights.count', -1 do
      @flight_to_cancel.destroy
    end
  end

  test "airport has arriving flights associated" do
    assert_difference '@arrival_airport.arriving_flights.count', -1 do
      @flight_to_cancel.destroy
    end
  end
end
