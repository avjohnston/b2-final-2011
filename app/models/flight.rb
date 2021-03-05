class Flight < ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  # def self.alph_order
  #   order(:departure_city)
  # end

  def self.order_by_passengers
    # found two ways to do it and didn't know which was better

    # joins(:flight_passengers)
    # .select('flights.*, count(flight_passengers.passenger_id) as passenger_count')
    # .group('flights.id')
    # .order('passenger_count desc, flights.departure_city')
    
    joins(:passengers)
    .group(:id)
    .order("passengers.count DESC, flights.departure_city")
  end

  def adult_passengers
    passengers.where('age >= ?', '18')
  end

  def passengers_average_age
    adult_passengers.average(:age)
  end

  def passenger_count
    passengers.size
  end
end
