require 'byebug'
require_relative 'AA_Questions'
require 'active_support/inflector'
require 'sqlite3'

class Table
  def self.table
    self.to_s.tableize
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.get_first_row(<<-SQL, id)
      SELECT 
        *
      FROM 
        #{table}
      WHERE 
        id = ?
    SQL

    if data.nil?
      nil
    else
      self.new(data)
    end
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM #{table}")
    data.map { |datum| self.new(datum) }
  end

  # def self.where(options)
  #   data = []
  #   options.each do |k, v|
  #     data << QuestionsDatabase.instance.execute(<<-SQL, k, v)
  #       SELECT
  #         *
  #       FROM
  #         #{table}
  #       WHERE
  #         ? = ?
  #     SQL
  #   end
  #   # byebug
  #   data.map { |datum| self.new(datum) }
  # end


end