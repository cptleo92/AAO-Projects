require_relative 'AA_Questions'
require_relative 'user'
require_relative 'question'
require_relative 'table'
require 'sqlite3'

class QuestionFollow < Table
  attr_accessor :id, :user_id, :question_id 

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
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

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_id
      GROUP BY
        title
      ORDER BY
        COUNT(title) DESC
      LIMIT ?
    SQL
    data.map { |datum| Question.new(datum) }
  end
end