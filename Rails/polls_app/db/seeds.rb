# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


leo = User.create!(username: 'Leo')
cat = User.create!(username: 'Cat')
pan = User.create!(username: 'Pan')

food = Poll.create!(title: 'Favorite Foods', user_id: leo.id)
food_q1 = Question.create!(text: 'What is your favorite cuisine?', poll_id: food.id)
food_q2 = Question.create!(text: 'How much coffee do you drink?', poll_id: food.id)
food_q3 = Question.create!(text: 'Which of the following do you consider yourself as? ', poll_id: food.id)

food_q1_a1 = AnswerChoice.create!(text: 'European', question_id: food_q1.id)  
food_q1_a2 = AnswerChoice.create!(text: 'Asian', question_id: food_q1.id)  
food_q1_a3 = AnswerChoice.create!(text: 'American', question_id: food_q1.id)  
food_q1_a4 = AnswerChoice.create!(text: 'I eat all food', question_id: food_q1.id)

food_q2_a1 = AnswerChoice.create!(text: 'Less than 1 cup a day', question_id: food_q2.id)
food_q2_a2 = AnswerChoice.create!(text: '1-2 cups a day', question_id: food_q2.id)
food_q2_a3 = AnswerChoice.create!(text: '2-4 cups a day', question_id: food_q2.id)
food_q2_a4 = AnswerChoice.create!(text: 'None of the above, aka I am caffeine incarnate', question_id: food_q2.id)

food_q3_a1 = AnswerChoice.create!(text: 'Vegetarian', question_id: food_q3.id)
food_q3_a2 = AnswerChoice.create!(text: 'Pescatarian', question_id: food_q3.id)
food_q3_a3 = AnswerChoice.create!(text: 'Vegan', question_id: food_q3.id)
food_q3_a4 = AnswerChoice.create!(text: 'None of the above', question_id: food_q3.id)

music = Poll.create!(title: 'Music', user_id: cat.id)
music_q1 = Question.create!(text: 'What is your favorite genre?', poll_id: music.id)
music_q2 = Question.create!(text: 'Do you have a preferred streaming service?', poll_id: music.id)
music_q3 = Question.create!(text: 'How many concerts do you attend a year?', poll_id: music.id)

music_q1_a1 = AnswerChoice.create!(text: 'Rap', question_id: music_q1.id)  
music_q1_a2 = AnswerChoice.create!(text: 'Rock', question_id: music_q1.id)  
music_q1_a3 = AnswerChoice.create!(text: 'Pop', question_id: music_q1.id)  
music_q1_a4 = AnswerChoice.create!(text: 'Classical', question_id: music_q1.id)  
music_q1_a5 = AnswerChoice.create!(text: 'None of the above', question_id: music_q1.id)

music_q2_a1 = AnswerChoice.create!(text: 'Spotify', question_id: music_q2.id)
music_q2_a2 = AnswerChoice.create!(text: 'Amazon Music', question_id: music_q2.id)
music_q2_a3 = AnswerChoice.create!(text: 'Youtube', question_id: music_q2.id)
music_q2_a4 = AnswerChoice.create!(text: 'None of the above', question_id: music_q2.id)

music_q3_a1 = AnswerChoice.create!(text: 'Less than 1', question_id: music_q3.id)
music_q3_a2 = AnswerChoice.create!(text: '2 to 4', question_id: music_q3.id)
music_q3_a3 = AnswerChoice.create!(text: '5-8', question_id: music_q3.id)
music_q3_a4 = AnswerChoice.create!(text: 'More than 8', question_id: music_q3.id)

leo_resp4 = Response.create!(user_id: leo.id, answer_id: music_q1_a2.id)
leo_resp5 = Response.create!(user_id: leo.id, answer_id: music_q2_a1.id)
leo_resp6 = Response.create!(user_id: leo.id, answer_id: music_q3_a2.id)

cat_resp1 = Response.create!(user_id: cat.id, answer_id: food_q1_a2.id)
cat_resp2 = Response.create!(user_id: cat.id, answer_id: food_q2_a2.id)
cat_resp3 = Response.create!(user_id: cat.id, answer_id: food_q3_a4.id)

pan_resp1 = Response.create!(user_id: pan.id, answer_id: food_q1_a1.id)
pan_resp2 = Response.create!(user_id: pan.id, answer_id: food_q2_a4.id)
pan_resp3 = Response.create!(user_id: pan.id, answer_id: food_q3_a3.id)
pan_resp4 = Response.create!(user_id: pan.id, answer_id: music_q1_a5.id)
pan_resp5 = Response.create!(user_id: pan.id, answer_id: music_q2_a4.id)
pan_resp6 = Response.create!(user_id: pan.id, answer_id: music_q3_a3.id)