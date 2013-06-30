require 'sqlite3'

# If you want to overwrite your database you will need 
# to delete it before running this file
$db = SQLite3::Database.new "students.db"

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          gender CHAR(1) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(50) NOT NULL,
          phone VARCHAR(40) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute(
      <<-SQL
        INSERT INTO students 
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Brick','Thornton','m','19851214','brick@devbootcamp.com','(415) 123-6834',DATETIME('now'), DATETIME('now')),
          ('Jared','Smith','m','19920615','jaredsmithse@icloud.com','(315) 345-9956',DATETIME('now'), DATETIME('now')),
          ('Greg','Varias','m','19860211','greg@hooha.com','(555) 123-6789',DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
end

class Student
  @@students = []
  def initialize(data)
    @first_name = data[1]
    @last_name = data[2]
    @gender = data[3]
    @birthday = data[4]
    @email = data[5]
    @phone = data[6]
  end

  def save
    $db.execute(
      <<-SQL
        INSERT INTO students 
        (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
        ('#{@first_name}', '#{@last_name}', '#{@gender}', '#{@birthday}', '#{@email}', '#{@phone}', DATETIME('now'), DATETIME('now'));
      SQL
        )
  end

  def self.all
    $db.execute('SELECT * FROM students;').compact.each do |student_data|
      @@students << Student.new(student_data)
    end
    puts @@students.compact
  end

  def self.delete(id)
    $db.execute(
      <<-SQL
      DELETE FROM students WHERE id = '#{id}';
      SQL
      )
  end

  def self.find_by_first(name)
    $db.execute("SELECT * FROM students WHERE first_name = '#{name}';")
  end

  def self.find_by_attr(attribute, query)
    $db.execute("SELECT * FROM students WHERE #{attribute} = '#{query}';")
  end
end

StudentDB.setup
StudentDB.seed

student = Student.new(['Indiana','Jones','m','19700614','dr_jones@temple.com','310581-2098'])
student.save

Student.delete(1)

p Student.all
puts Student.find_by_first('Indiana')
puts Student.find_by_attr('last_name','Varias')
