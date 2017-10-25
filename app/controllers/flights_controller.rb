class FlightsController < ApplicationController
  before_action :form_data

  def search
    @flights = Flight.all
    @passengers = params[:passengers]
    @passengers ||= 1

    if params[:flight]
      if params[:flight][:departure_date]
        departure_date = DateTime.strptime(params[:flight][:departure_date], '%D')
        departure_search_range = departure_date.midnight..(departure_date.midnight + 1.day)
        @flights = @flights.where(departure_date: departure_search_range)
      end

      if params[:flight][:departure_airport]
        @flights = @flights.where("departure_airport_id = ?", params[:flight][:departure_airport])
      end

      if params[:flight][:arrival_airport]
        @flights = @flights.where("arrival_airport_id = ?", params[:flight][:arrival_airport])
      end
    end

    render 'static_pages/home'
  end
end
