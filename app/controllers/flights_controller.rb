class FlightsController < ApplicationController
  before_action :new_flight

  def search
    render 'static_pages/home'
  end
end
