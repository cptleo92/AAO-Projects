# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


elmo = Cat.create!(name: 'Elmo', sex: 'M', birth_date: '2015/10/20', description: 'Elmo loves to crawl up in a corner and hiss at anyone who comes close.', color: 'Black')
simba = Cat.create!(name: 'Simba', sex: 'M', birth_date: '2010/12/04', description: 'Long may he slumber...', color: 'Chocolate')
coco = Cat.create!(name: 'Coco', sex: 'F', birth_date: '2020/9/15', description: 'Coco is basically a dog in a cat''s body.', color: 'Lilac')
luna = Cat.create!(name: 'Luna', sex: 'F', birth_date: '2016/1/20', description: 'Much like the moon itself, Luna isn''t content with earthly matters. Her habitat is her own.', color: 'Cream')
kit = Cat.create!(name: 'Kit', sex: 'M', birth_date: '2012/5/25', description: 'The only thing that matters to Kit is Kit.', color: 'Caramel')
whiskers = Cat.create!(name: 'Whiskers', sex: 'F', birth_date: '2011/7/6', description: 'Whiskers will judge you. And you should feel bad.', color: 'Black')