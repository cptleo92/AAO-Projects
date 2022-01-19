require_relative 'AA_Questions'
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

end