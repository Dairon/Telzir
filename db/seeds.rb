# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PhonePlan.create(name: "FaleMais 30", free_time: 30)
PhonePlan.create(name: "FaleMais 60", free_time: 60)
PhonePlan.create(name: "FaleMais 120", free_time: 120)

OriginDestinationFare.create(origin: "011", destination: "016", fare: 1.90)
OriginDestinationFare.create(origin: "016", destination: "011", fare: 2.90)
OriginDestinationFare.create(origin: "011", destination: "017", fare: 1.70)
OriginDestinationFare.create(origin: "017", destination: "011", fare: 2.70)
OriginDestinationFare.create(origin: "011", destination: "018", fare: 0.90)
OriginDestinationFare.create(origin: "018", destination: "011", fare: 1.90)