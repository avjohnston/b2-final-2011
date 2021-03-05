require 'rails_helper'

RSpec.describe 'flights index page', type: :feature do
  before :each do
    @flight = Flight.create!(number: 1727, date: '08/03/20', departure_city: 'Denver', arrival_city: 'Phoenix')
    @flight2 = Flight.create!(number: 1745, date: '06/22/20', departure_city: 'Atlanta', arrival_city: 'New York')
    @flight3 = Flight.create!(number: 1631, date: '09/30/20', departure_city: 'Phoenix', arrival_city: 'Los Angeles')
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

    within "#flight-#{@flight3.id}" do
      expect(page).to have_content("Number: #{@flight3.number}")
      expect(page).to have_content("Date: #{@flight3.date}")
      expect(page).to have_content("Departure: #{@flight3.departure_city}")
      expect(page).to have_content("Arrival: #{@flight3.arrival_city}")
    end
  end
end
