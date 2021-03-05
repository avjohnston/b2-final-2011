require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  describe 'relationships' do
    it { should belong_to(:flight) }
    it { should belong_to(:passenger) }
  end

  before :each do
    @flight = Flight.create!(number: 1727, date: '08/03/20', departure_city: 'Denver', arrival_city: 'Phoenix')
    @passenger = Passenger.create!(name: 'Andrew', age: '29')
    @flight_passenger = FlightPassenger.create!(flight: @flight, passenger: @passenger)
  end

  describe 'class methods' do
    it '#destroy' do
      FlightPassenger.delete(@flight.id, @passenger.id)

      expect(FlightPassenger.count).to eq(0)
    end
  end
end
