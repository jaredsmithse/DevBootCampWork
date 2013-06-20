require 'sqlite3'
require 'csv'

# If you want to overwrite your database you will need 
# to delete it before running this file
# original gist : https://gist.github.com/122ff0c59de273496723
$db = SQLite3::Database.new "politicians.db"

module PoliticianDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE politicians (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR(35),
          party CHAR(1),
          state CHAR(2),
          lattitude REAL,
          longitude REAL,
          grade_level_since_1996 REAL,
          grade_level REAL,
          years_in_congress INTEGER,
          dw1_score REAL
        );
      SQL
    )
  end

  def self.seed(filename)
    CSV.foreach(filename) do |entry|
      next if entry[0] == "Name"
      state, lat, long = entry[2].sub("(","").sub(")","").sub(",","").split(" ")
      $db.execute(
        <<-SQL
          INSERT INTO politicians 
            (name, party, state, longitude, lattitude, grade_level_since_1996, grade_level, years_in_congress, dw1_score)
          VALUES
            ('#{entry[0]}', '#{entry[1]}', '#{state}', '#{lat}', '#{long}', '#{entry[3]}', '#{entry[4]}', '#{entry[5]}', '#{entry[6]}');
        SQL
      )
    end
  end

  def self.drop
    $db.execute("DROP politicians IF EXISTS;")
  end
end

class Politician
  @@politicians = []
  def initialize(data)
    @name = data[0] 
    @party = data[1] 
    @state = data[2] 
    @longitude = data[3] 
    @lattitude = data[4] 
    @grade_level_since_1996 = data[5] 
    @grade_level = data[6] 
    @years_in_congress = data[7] 
    @dw1_score = data[8]  
  end

  def save
    $db.execute(
      <<-SQL
        INSERT INTO politicians 
          (name, party, state, longitude, lattitude, grade_level_since_1996, grade_level, years_in_congress, dw1_score)
        VALUES
          ('#{entry[0]}', '#{entry[1]}', '#{state}', '#{lat}', '#{long}', '#{entry[3]}', '#{entry[4]}', '#{entry[5]}', '#{entry[6]}');
      SQL
        )
  end

  def self.all
    $db.execute('SELECT * FROM politicians;').compact.each do |politician_data|
      puts politician_data
    end
  end

  def self.where(query, *args)
    $db.execute("SELECT * FROM politicians WHERE #{query}", *args).map do |row|
      Politician.new(row)
    end
  end

  def self.delete(id)
    where('id = ?',id)
  end

end
PoliticianDB.setup
PoliticianDB.seed('politician_data.csv')
Politician.delete(1)




