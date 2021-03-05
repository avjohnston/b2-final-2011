class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.self_find(flight_id, passenger_id)
    find_by(flight_id: flight_id, passenger_id: passenger_id)    
  end
end
