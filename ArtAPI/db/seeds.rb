# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'leo@gmail.com')
User.create!(username: 'cat@yahoo.com')

Artwork.create!(title: 'Mona Lisa', image_url: '123.jpg', artist_id: 1)
Artwork.create!(title: 'Scream', image_url: '456.jpg', artist_id: 1)

ArtworkShare.create!(viewer_id: 2, artwork_id: 1)