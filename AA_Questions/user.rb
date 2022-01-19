require_relative 'AA_Questions'
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
    QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        users 
      WHERE 
        id = ?
    SQL
  end

end