# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(username: "demo", password: "password")
user2 = User.create!(username: "todd", password: "password")


todo1 = Todo.create!(title: "Laundry", body: "Wash everything!", done: false, user_id: user1.id)
todo2 = Todo.create!(title: "Groceries", body: "Eggs, milk, bread", done: false, user_id: user1.id)
todo3 = Todo.create!(title: "Study", body: "Rails and etc", done: true, user_id: user2.id)


step1 = Step.create!(title: "Washer", body: "2 tide pods", done: false, todo_id: todo1.id)
step2 = Step.create!(title: "Dryer", body: "2 dryer sheets", done: false, todo_id: todo1.id)
step3 = Step.create!(title: "Rails", body: "Migrations", done: false, todo_id: todo3.id)

tag1 = Tag.create!(name: "sports")
tag2 = Tag.create!(name: "music")
tag3 = Tag.create!(name: "food")
tag4 = Tag.create!(name: "important")