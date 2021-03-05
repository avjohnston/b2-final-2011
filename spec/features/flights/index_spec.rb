require 'rails_helper'

RSpec.describe 'flights index page', type: :feature do
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
    @passenger7 = Passenger.create!(name: 'Doug', age: '18')
    @passenger8 = Passenger.create!(name: 'Nina', age: '55')
    FlightPassenger.create!(flight: @flight2, passenger: @passenger7)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger8)
    FlightPassenger.create!(flight: @flight, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight, passenger: @passenger6)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger5)
  end

  it 'flight index page has each flight listed with its attributes' do
    visit flights_path

    expect(page).to have_content('Flight Index')

    within "#flight-#{@flight.id}" do
      expect(page).to have_content("Number: #{@flight.number}")
      expect(page).to have_content("Date: #{@flight.date}")
      expect(page).to have_content("Departure: #{@flight.departure_city}")
      expect(page).to have_content("Arrival: #{@flight.arrival_city}")
    end
    within "#flight-#{@flight2.id}" do
      expect(page).to have_content("Number: #{@flight2.number}")
      expect(page).to have_content("Date: #{@flight2.date}")
      expect(page).to have_content("Departure: #{@flight2.departure_city}")
      expect(page).to have_content("Arrival: #{@flight2.arrival_city}")
    end

    within "#flight-#{@flight3.id}" do
      expect(page).to have_content("Number: #{@flight3.number}")
      expect(page).to have_content("Date: #{@flight3.date}")
      expect(page).to have_content("Departure: #{@flight3.departure_city}")
      expect(page).to have_content("Arrival: #{@flight3.arrival_city}")
    end
  end

  it 'when i click the flight number it takes me to the flights show page' do
    visit flights_path

    within "#flight-#{@flight.id}" do
      click_link("#{@flight.number}")

      expect(current_path).to eq(flight_path(@flight))
    end
  end

  describe 'orderly' do
    let(:flight) { "#{@flight.number}" }
    let(:flight2) { "#{@flight2.number}" }
    let(:flight3) { "#{@flight3.number}" }

    it 'flights are ordered by number of passengers first and then alphabetically' do
      visit flights_path

      expect(flight2).to appear_before(flight)
      expect(flight2).to appear_before(flight3)
      expect(flight2).to appear_before(flight)
      expect(flight).to appear_before(flight3)
    end
  end
end
