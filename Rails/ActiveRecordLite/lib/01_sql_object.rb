require_relative 'db_connection'
require 'byebug'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @columns = cols[0].map { |col| col.to_sym }
    @columns
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) { self.attributes[col] }
      define_method("#{col}=") { |value| self.attributes[col] = value }
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.underscore.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT 
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map do |result|
      new(result)
    end
  end

  def self.find(id)
    obj = DBConnection.execute(<<-SQL, id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?     
    SQL
    obj[0] ? new(obj[0]) : nil
  end

  def initialize(params = {})
    params.each do |k, val|
      atr = k.to_sym
      raise "unknown attribute '#{atr}'" unless self.class.columns.include?(atr)
      
      self.send("#{atr}=", val)
    end
  end

  def attributes
    return @attributes if @attributes

    @attributes = {}
  end

  def attribute_values
    self.class.columns.map { |col| self.send("#{col}") }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns(&:to_s).map { |col| "#{col} = ?" }
    set_cols = col_names.join(", ")
    # byebug
    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE 
        #{self.class.table_name}
      SET
        #{set_cols}
      WHERE
        id = ?
      SQL
  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
