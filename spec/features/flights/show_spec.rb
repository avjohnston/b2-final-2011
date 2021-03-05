require 'rails_helper'

RSpec.describe 'flights show page', type: :feature do
  before :each do
    @flight = Flight.create!(number: 1727, date: '08/03/20', departure_city: 'Denver', arrival_city: 'Phoenix')
    @passenger1 = Passenger.create!(name: 'Andrew', age: '29')
    @passenger2 = Passenger.create!(name: 'Khoa', age: '34')
    @passenger3 = Passenger.create!(name: 'Janis', age: '25')
    @passenger4 = Passenger.create!(name: 'Penny', age: '5')
    @passenger5 = Passenger.create!(name: 'Norm', age: '3')
    FlightPassenger.create!(flight: @flight, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight, passenger: @passenger5)
  end

  it 'show page has flight and its attributes' do
    visit flight_path(@flight)

    expect(page).to have_content("Flight ##{@flight.number}")
    expect(page).to have_content("Date: #{@flight.date}")
    expect(page).to have_content("Departure: #{@flight.departure_city}")
    expect(page).to have_content("Arrival: #{@flight.arrival_city}")
  end

  it 'show page has names of all adult passengers' do
    visit flight_path(@flight)

    within "#passenger-#{@passenger1.id}" do
      expect(page).to have_content("* #{@passenger1.name}")
    end

    within "#passenger-#{@passenger3.id}" do
      expect(page).to have_content("* #{@passenger3.name}")
    end

    expect(page).to_not have_content("#{@passenger4.name}")
    expect(page).to_not have_content("#{@passenger5.name}")
  end

  it 'show page has average age of all adult passengers' do
    visit flight_path(@flight)

    expect(page).to have_content("Average Age Of Adult Passengers: #{@flight.passengers_average_age.round(1)}")
  end

  it 'show page has a button to remove each passenger from the flight' do
    visit flight_path(@flight)

    within "#passenger-#{@passenger1.id}" do
      expect(page).to have_button("Remove Passenger")
    end

    within "#passenger-#{@passenger3.id}" do
      expect(page).to have_button("Remove Passenger")
    end
  end

  it 'when i click the remove passenger button it removes the passenger from the flight' do
    visit flight_path(@flight)

    within "#passenger-#{@passenger1.id}" do
      click_on "Remove Passenger"
    end

    expect(current_path).to eq(flight_path(@flight))
    expect(page).to_not have_content("* #{@passenger1.name}")
  end

end
