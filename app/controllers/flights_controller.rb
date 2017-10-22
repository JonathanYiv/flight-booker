class FlightsController < ApplicationController
  def search
    @flight = Flight.new
    render 'static_pages/home'
  end
end
