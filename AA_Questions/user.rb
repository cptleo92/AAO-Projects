require_relative 'AA_Questions'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'
require 'sqlite3'

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        users 
      WHERE 
        id = ?
    SQL
    (data.map { |datum| User.new(datum) })[0]
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
end