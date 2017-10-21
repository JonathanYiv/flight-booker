require 'test_helper'

class AirportTest < ActiveSupport::TestCase

  def setup
    @airport = airports(:one)
  end

  test "should be valid" do
    assert @airport.valid?
  end

  test "name should be present" do
    @airport.name = nil
    assert_not @airport.valid?
  end

  test "abbreviation should be present" do
    @airport.abbreviation = nil
    assert_not @airport.valid?
  end
end
