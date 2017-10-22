class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def new_flight
      @flight = Flight.new
    end
end
