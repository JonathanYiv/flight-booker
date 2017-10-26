class BookingsController < ApplicationController
  before_action :check_for_selected_flight, only: :new
  before_action :valid_passengers, only: :create

  def new
    @flight = Flight.find(params[:flight])
    @passengers = params[:passengers].to_i
  end

  def create
    params[:passengers].to_i.times do |i|
      passenger = Passenger.create(name: params["passenger#{i}"][:name], email: params["passenger#{i}"][:email])
      booking = Flight.find(params[:flight]).bookings.create(passenger: passenger)
    end
    flash[:success] = "You have reserved your booking!"
    redirect_to root_path
  end

  private

    def check_for_selected_flight
      unless params[:flight]
        flash[:warning] = "You haven't selected a flight!"
        redirect_to root_path
      end
    end

    def valid_passengers
      params[:passengers].to_i.times do |i|
        passenger = Passenger.new(name: params["passenger#{i}"][:name], email: params["passenger#{i}"][:email])
        unless passenger.valid?
          flash[:warning] = "Invalid input."
          @flight = Flight.find(params[:flight])
          @passengers = params[:passengers].to_i
          render 'new'
        end
      end
    end
end
