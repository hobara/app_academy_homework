require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    keys = params.keys.map do |k|
      "#{k} = ?"
    end.join(" AND ")
    # p keys
    v = params.values
    res = DBConnection.execute(<<-SQL, v)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{keys}
    SQL
    parse_all(res)
  end
end

class SQLObject
  extend Searchable
end
