# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@flight = Flight.create!(number: 1727, date: '08/03/20', departure_city: 'Denver', arrival_city: 'Phoenix', time: '5:00 PM')
@flight2 = Flight.create!(number: 1745, date: '06/22/20', departure_city: 'Atlanta', arrival_city: 'New York', time: '2:00 PM')
@flight3 = Flight.create!(number: 1631, date: '09/30/20', departure_city: 'Phoenix', arrival_city: 'Los Angeles', time: '7:00 AM')
@passenger1 = Passenger.create!(name: 'Andrew', age: '29')
@passenger2 = Passenger.create!(name: 'Khoa', age: '34')
@passenger3 = Passenger.create!(name: 'Janis', age: '25')
@passenger4 = Passenger.create!(name: 'Penny', age: '5')
@passenger5 = Passenger.create!(name: 'Norm', age: '3')
@passenger6 = Passenger.create!(name: 'Jake', age: '30')
@passenger7 = Passenger.create!(name: 'Doug', age: '18')
@passenger8 = Passenger.create!(name: 'Nina', age: '55')
FlightPassenger.create!(flight: @flight, passenger: @passenger1)
FlightPassenger.create!(flight: @flight, passenger: @passenger2)
FlightPassenger.create!(flight: @flight, passenger: @passenger6)
FlightPassenger.create!(flight: @flight2, passenger: @passenger4)
FlightPassenger.create!(flight: @flight3, passenger: @passenger3)
FlightPassenger.create!(flight: @flight3, passenger: @passenger5)
FlightPassenger.create!(flight: @flight2, passenger: @passenger7)
FlightPassenger.create!(flight: @flight2, passenger: @passenger8)
