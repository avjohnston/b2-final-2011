class Flight < ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.alph_order
    order(:departure_city)
  end

  def self.order_by_passengers
    joins(:flight_passengers)
    .select('flights.*, count(flight_passengers.passenger_id) as passenger_count')
    .group('flights.id')
    .order('passenger_count desc, flights.departure_city')
  end

  def adult_passengers
    passengers.where('age > ?', '17')
  end

  def passengers_average_age
    adult_passengers.average(:age)
  end
end
