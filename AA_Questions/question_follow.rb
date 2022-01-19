require_relative 'AA_Questions'
require_relative 'user'
require_relative 'question'
require 'sqlite3'

class QuestionFollow
  attr_accessor :id, :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        question_follows 
      WHERE 
        id = ?
    SQL
    (data.map { |datum| QuestionFollow.new(datum) })[0]
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT * FROM users WHERE id IN (SELECT user_id FROM question_follows WHERE question_id = ?)
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id IN (
          SELECT
            question_id
          FROM
            question_follows        
          WHERE
            user_id = ?
        )
    SQL
    data.map { |datum| Question.new(datum) }
  end
end