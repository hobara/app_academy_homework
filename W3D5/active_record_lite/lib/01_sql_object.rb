require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!

    self.columns.each do |col_name|
      define_method(col_name) do
        # instance_variable_get("@#{col_name}")
        self.attributes[col_name]
      end
      define_method("#{col_name}=") do |val|
        # instance_variable_set("@#{col_name}", val)
        self.attributes[col_name] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.downcase.pluralize
  end

  def self.all
    rows = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL
    parse_all(rows)
  end

  def self.parse_all(results)
    # p results
    results.map do |hash|
      self.new(hash)
    end

  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL
    parse_all(results).first
  end

  def initialize(params = {})
    # p params
    # p self.class.columns
    params.each do |attr_name, val|
      if self.class.columns.include?(attr_name.to_sym)
        self.send("#{attr_name}=", val)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end

  end

  def attributes
    return @attributes if @attributes
    @attributes = {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    # p self.attributes
    # p self.class.table_name
    cols = self.class.columns[1..-1]
    col_name = cols.map(&:to_s).join(", ")
    questions = (["?"] * cols.length).join(", ")
    # p col_name
    # p questions
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_name})
      VALUES
        (#{questions})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    p self
    cols = self.class.columns[1..-1]
    col_name = cols.map(&:to_s).join(", ")
    questions = (["?"] * cols.length).join(", ")
    id = attributes[:id]
    p id
    p attribute_values
    DBConnection.execute(<<-SQL, *attribute_values[1..-1], id)
      UPDATE
        #{self.class.table_name}
      SET
        (#{col_name}) = (#{questions})
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    id = self.attributes[:id]
    if id.nil?
      self.insert
    else
      self.update
    end
  end

end
