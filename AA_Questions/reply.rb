require_relative 'AA_Questions'
require_relative 'user'
require_relative 'question'
require 'sqlite3'

class Reply
  attr_accessor :id, :question_id, :parent_id, :user_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        replies 
      WHERE 
        id = ?
    SQL
    (data.map { |datum| Reply.new(datum) })[0]
  end  

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        *
      FROM 
        replies 
      WHERE 
        user_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end 

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM 
        replies 
      WHERE 
        question_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end 

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    raise "no parent reply" unless @parent_id
    Reply.find_by_id(@parent_id) 
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT 
        *
      FROM 
        replies 
      WHERE 
        parent_id = ?      
    SQL
    data.map { |datum| Reply.new(datum) }
  end
end