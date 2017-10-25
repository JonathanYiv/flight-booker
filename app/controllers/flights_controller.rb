class FlightsController < ApplicationController
  before_action :form_data

  def search
    @flights = Flight.all
    render 'static_pages/home'
  end
end
