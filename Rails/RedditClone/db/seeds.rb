# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
  User.create!(username: Faker::TvShows::TheExpanse.character, password: 'password')
end


4.times do
  Sub.create!(title: Faker::Appliance.brand, description: Faker::Appliance.equipment, moderator_id: rand(1..5))
end


10.times do 
  Post.create!(title: Faker::TvShows::TheExpanse.location, content: Faker::TvShows::TheExpanse.quote, author_id: rand(1..5))  
end

Post.all.each do |post|
  PostSub.create!(post_id: post.id, sub_id: rand(1..4))
end




