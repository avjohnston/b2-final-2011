class FlightPassengersController < ApplicationController
  def destroy
    @flight = Flight.find(params[:id])
    FlightPassenger.delete(params[:id], params[:passenger_id])

    redirect_to flight_path(@flight)
  end
end
