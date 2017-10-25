require 'byebug'
require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    where_query = params.keys.map do |attr_name|
      attr_name.to_s + ' = ?'
    end.join(' AND ')
    param_vals = params.values
    data = DBConnection.execute(<<-SQL, param_vals)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_query}
    SQL
    data.map { |object| self.new(object) }
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
