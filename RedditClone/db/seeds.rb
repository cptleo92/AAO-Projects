# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

leo = User.create!(username: 'Leo', password: 'password')
cat = User.create!(username: 'Cat', password: 'password')
pan = User.create!(username: 'Pan', password: 'password')

animals = Sub.create!(title: 'Animals', description: 'Love animals!', moderator_id: leo.id)
music = Sub.create!(title: 'music', description: 'Love music!', moderator_id: cat.id)

p1 = Post.create!(title:'Hi!', content: 'I love dogs!', sub_id: animals.id, author_id: pan.id)
p2 = Post.create!(title:'Where do I find a piano?', sub_id: music.id, author_id: cat.id)
p3 = Post.create!(title:'Baby elephants', url: 'www.babyelephant.com', sub_id: animals.id, author_id: leo.id)
p4 = Post.create!(title:'Hi!', content: 'I love guitars!', sub_id: music.id, author_id: pan.id)

