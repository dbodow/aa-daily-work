require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    unless @columns
      columns = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
      @columns = columns.first.map { |el| el.to_sym }
    end

    @columns
  end

  # def self.lookup_column_names
  #   lookup_table = self.table_name
  #   DBConnection.execute2(<<-SQL)
  #     SELECT
  #       *
  #     FROM
  #       #{lookup_table}
  #   SQL
  # end

  def self.finalize!
    columns.each do |col_name|
      define_method(col_name) do
        attributes[col_name]
      end
      define_method(col_name.to_s + '=') do |arg|
        attributes[col_name] = arg
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name || self.to_s.tableize
  end

  def self.all
    # ...
    data = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
    parse_all(data)
  end

  def self.parse_all(results)
    # ...
    results.map { |param_hash| self.new(param_hash) }
  end

  def self.find(id)
    # ...
    data = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    parse_all(data).first
  end

  def initialize(params = {})
    # ...
    cols = self.class.columns
    params.each do |attr_name, value|
      name = attr_name.to_sym
      name_writer = (attr_name.to_s + '=').to_sym
      raise "unknown attribute '#{attr_name}'" unless cols.include?(name)
      send(name_writer, value)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
    @attributes
  end

  def attribute_values
    # ...
    self.class.columns.map { |col_name| send(col_name) }
  end

  def insert
    # ...
    col_names = self.class.columns.join(', ')
    question_marks = (['?'] * self.class.columns.length).join(', ')
    # debugger
    DBConnection.execute(<<-SQL, attribute_values)
    INSERT INTO
      #{self.class.table_name} (#{col_names})
    VALUES
      (#{question_marks})
    SQL
    send(:id=, DBConnection.last_insert_row_id)
  end

  def update
    # ...
    set_str = self.class.columns.map do |col_name|
      col_name.to_s + ' = ?'
    end.join(', ')
    # debugger
    DBConnection.execute(<<-SQL, attribute_values, id)
    UPDATE
      #{self.class.table_name}
    SET
      #{set_str}
    WHERE
      id = ?
    SQL
  end

  def save
    # ...
    if id
      update
    else
      insert
    end
  end
end
