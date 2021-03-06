require_relative 'AA_Questions'
require_relative 'user'
require_relative 'question'
require_relative 'table'
require 'sqlite3'

class Reply < Table
  attr_accessor :id, :question_id, :parent_id, :user_id, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
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

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @body, @user_id, @parent_id, @id)
        UPDATE
          replies
        SET
          question_id = ?, body = ?, user_id = ?, parent_id = ?
        WHERE
          id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body)
        INSERT INTO
          replies (question_id, parent_id, user_id, body)
        VALUES
          (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end