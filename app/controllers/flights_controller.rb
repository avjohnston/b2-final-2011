class FlightsController < ApplicationController
  def index
    @flights = Flight.order_by_passengers
  end

  def show
    @flight = Flight.find(params[:id])
    @passengers = @flight.adult_passengers
  end
end
