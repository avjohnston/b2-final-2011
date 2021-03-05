# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
flight = Flight.create!(number: 1727, date: '08/03/20', departure_city: 'Denver', arrival_city: 'Phoenix')

passenger1 = Passenger.create!(name: 'Andrew', age: '29')
passenger2 = Passenger.create!(name: 'Khoa', age: '34')
passenger3 = Passenger.create!(name: 'Janis', age: '25')
passenger4 = Passenger.create!(name: 'Penny', age: '5')
passenger5 = Passenger.create!(name: 'Norm', age: '3')

FlightPassenger.create!(flight: flight, passenger: passenger1)
FlightPassenger.create!(flight: flight, passenger: passenger2)
FlightPassenger.create!(flight: flight, passenger: passenger3)
FlightPassenger.create!(flight: flight, passenger: passenger4)
FlightPassenger.create!(flight: flight, passenger: passenger5)
