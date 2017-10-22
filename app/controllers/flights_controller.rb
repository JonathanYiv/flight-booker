class FlightsController < ApplicationController
  before_action :form_data

  def search
    # redirect_to search_path(test: true)

    # when clicking the 'search' button, the form data will submit as params, not as a query parameter
    # I need it to be a query parameter
    # The above commented out code is a possible step in the right direction
    render 'static_pages/home'
  end
end
