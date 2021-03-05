class FlightPassengersController < ApplicationController
  def destroy
    @flight = Flight.find(params[:id])
    @flight_passenger = FlightPassenger.self_find(params[:id], params[:passenger_id])
    FlightPassenger.destroy(@flight_passenger.id)

    redirect_to flight_path(@flight)
  end
end
