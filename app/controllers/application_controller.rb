class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def form_data
      @flight = Flight.new

      @passenger_options = []
      @passenger_options << ["Choose your option", 0, disabled: true, selected: true]
      @passenger_options << ["1 Passenger", 1]
      (2..20).each do |num|
        @passenger_options << ["#{num} Passengers", num]
      end

      @airport_options = Airport.all.to_a.unshift(Airport.new(id: 0, name: "Choose your option"))
    end
end
