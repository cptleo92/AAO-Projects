# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


bench1 = Bench.create!(description: "nice bench", lat: 37.780482, lng: -122.458895)
bench2 = Bench.create!(description: "decent bench", lat: 37.767015, lng: -122.448273)
bench3 = Bench.create!(description: "costco bench", lat: 37.771018, lng: -122.409048)