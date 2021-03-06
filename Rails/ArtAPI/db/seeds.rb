# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'leo@gmail.com')
User.create!(username: 'cat@yahoo.com')
User.create!(username: 'pan@gmail.com')

Artwork.create!(title: 'Mona Lisa', image_url: '123.jpg', artist_id: 1)
Artwork.create!(title: 'Scream', image_url: '456.jpg', artist_id: 1, favorite: true)
Artwork.create!(title: 'Vitruvian', image_url: 'v.jpg', artist_id: 2)
Artwork.create!(title: 'Ramen', image_url: 'r.jpg', artist_id: 2)
Artwork.create!(title: 'The Last Supper', image_url: 'tls.jpg', artist_id: 3, favorite: true)
Artwork.create!(title: 'Icebreaker', image_url: 'ice.jpg', artist_id: 3)
Artwork.create!(title: 'After 20', image_url: '20.jpg', artist_id: 3)
Artwork.create!(title: 'Under a Moon of Honey', image_url: 'moon.jpg', artist_id: 3)

ArtworkShare.create!(viewer_id: 2, artwork_id: 1, favorite: true)
ArtworkShare.create!(viewer_id: 3, artwork_id: 1)
ArtworkShare.create!(viewer_id: 1, artwork_id: 5, favorite: true)
ArtworkShare.create!(viewer_id: 1, artwork_id: 6)

Comment.create!(user_id: '1', artwork_id: '1', body: 'Please let me know what you think!')
Comment.create!(user_id: '1', artwork_id: '5', body: 'Love it!')
Comment.create!(user_id: '1', artwork_id: '4', body: 'Makes me hungry lol')
Comment.create!(user_id: '3', artwork_id: '2', body: 'too scary')
Comment.create!(user_id: '3', artwork_id: '4', body: 'why?')
Comment.create!(user_id: '3', artwork_id: '3', body: 'first')


Like.create!(user_id: '1', likeable_id: '4', likeable_type: 'Artwork')
Like.create!(user_id: '1', likeable_id: '3', likeable_type: 'Comment')
Like.create!(user_id: '2', likeable_id: '4', likeable_type: 'Comment')
Like.create!(user_id: '2', likeable_id: '2', likeable_type: 'Artwork')
Like.create!(user_id: '2', likeable_id: '6', likeable_type: 'Artwork')


