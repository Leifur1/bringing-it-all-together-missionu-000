class Dog
  attr_accessor :name, :breed, :id

  def initialize(id=nil, name, breed)
    @id = id
    @name = name
    @breed = breed
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF
      NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE dogs"
    DB[:conn].execute(sql)
  end

  def save
  end

  def self.create
  end

  def self.find_by_id
    sql = <<-SQL 
      SELECT * 
      FROM dogs
      WHERE id = ?
    SQL
    DB[:conn].execute(sql, self.id)
  end
end
