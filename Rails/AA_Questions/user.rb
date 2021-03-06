require_relative 'AA_Questions'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'table'
require 'sqlite3'

class User < Table
  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    (data.map { |datum| User.new(datum) })[0]
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT       
      --COUNT(DISTINCT question_likes.id) AS likes,
      --COUNT(DISTINCT questions.id) AS asked_qs
      CAST(COUNT(DISTINCT question_likes.id) AS FLOAT) / COUNT(DISTINCT questions.id) AS karma 
    FROM 
      questions 
    LEFT OUTER JOIN 
      question_likes ON questions.id = question_id 
    GROUP BY 
      author_id 
    HAVING 
      author_id = ?
    SQL
    data[0]["karma"]
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
          users (fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end