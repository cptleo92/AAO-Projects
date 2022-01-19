require_relative 'AA_Questions'
require 'sqlite3'

class Reply
  attr_accessor :id, :subject_id, :parent_id, :op_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @subject_id = options['subject_id']
    @parent_id = options['parent_id']
    @op_id = options['op_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        replies 
      WHERE 
        id = ?
    SQL
  end
  

end