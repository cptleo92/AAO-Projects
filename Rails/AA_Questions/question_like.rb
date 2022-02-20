require_relative 'AA_Questions'
require_relative 'user'
require_relative 'question'
require_relative 'table'
require 'sqlite3'

class QuestionLike < Table
  attr_accessor :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id IN (
          SELECT
            user_id
          FROM
            question_likes
          WHERE
            question_id = ?
        )
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        users
      WHERE
        users.id IN (
          SELECT
            user_id
          FROM
            question_likes
          WHERE
            question_id = ?
        )
    SQL
    data[0]["COUNT(*)"]
  end

  def self.liked_questions_for_user_id(user_id)
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
            question_likes
          WHERE
            user_id = ?
        )
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_likes
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