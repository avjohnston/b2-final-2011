require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it { should have_many(:flight_passengers) }
    it { should have_many(:passengers).through(:flight_passengers) }
  end

  before :each do
    @flight = Flight.create!(number: 1727, date: '08/03/20', departure_city: 'Denver', arrival_city: 'Phoenix')
    @flight2 = Flight.create!(number: 1745, date: '06/22/20', departure_city: 'Atlanta', arrival_city: 'New York')
    @flight3 = Flight.create!(number: 1631, date: '09/30/20', departure_city: 'Phoenix', arrival_city: 'Los Angeles')
    @passenger1 = Passenger.create!(name: 'Andrew', age: '29')
    @passenger2 = Passenger.create!(name: 'Khoa', age: '34')
    @passenger3 = Passenger.create!(name: 'Janis', age: '25')
    @passenger4 = Passenger.create!(name: 'Penny', age: '5')
    @passenger5 = Passenger.create!(name: 'Norm', age: '3')
    @passenger6 = Passenger.create!(name: 'Jake', age: '5')
    FlightPassenger.create!(flight: @flight, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight, passenger: @passenger6)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger5)

  end

  describe 'class methods' do
    it '#aplh_order' do
      expect(Flight.alph_order).to eq([@flight2, @flight, @flight3])
    end

    it '#order_by_passengers' do
      expect(Flight.order_by_passengers).to eq([@flight, @flight3, @flight2])

      @passenger7 = Passenger.create!(name: 'Doug', age: '18')
      @passenger8 = Passenger.create!(name: 'Nina', age: '55')
      FlightPassenger.create!(flight: @flight2, passenger: @passenger7)
      FlightPassenger.create!(flight: @flight2, passenger: @passenger8)

      expect(Flight.order_by_passengers).to eq([@flight2, @flight, @flight3])
    end
  end

  describe 'instance methods' do
    it '#adult_passengers' do
      expect(@flight.adult_passengers).to eq([@passenger1, @passenger2])
    end

    it '#passengers_average_age' do
      expect(@flight.passengers_average_age.round(1)).to eq(31.5)
    end
  end
end
