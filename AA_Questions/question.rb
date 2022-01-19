require_relative 'AA_Questions'
# require_relative 'user'
require 'sqlite3'

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_id(id)
    QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        questions 
      WHERE 
        id = ?
    SQL
  end

end