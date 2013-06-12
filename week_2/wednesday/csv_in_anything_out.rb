# original gist : https://gist.github.com/dbc-challenges/5135e3568ba673d8119a

require 'csv'
require 'yaml'
require 'json'
require 'date'
 
class Person
  attr_reader :id, :fname, :lname, :email, :phone, :created_at
  def initialize(info)
    @id = info[0]
    @fname = info[1]
    @lname = info[2]
    @email = info[3]
    @phone = info[4]
    @created_at = DateTime.parse(info[5])
  end

  def to_a
    [@id,@fname,@lname,@email,@phone,@created_at]
  end
end
 
class PersonParser
  attr_reader :file
  
  def initialize(file)
    @file = file
    @people = nil
  end
  
  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    return @people if @people
    @people = []
    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
    CSV.foreach(@file, 'r') do |line|
      next if line[0] == "id"
      @people << Person.new(line)
    end
    @people
  end

  def save
    CSV.open('parsedcsv.csv', 'w+') do |csv|
      csv << ['id','first_name','last_name','email','phone','created_at']
      @people.each do |person|
        csv << person.to_a
      end
    end
  end

  def save_as_yaml

  end

  def save_as_json

  end

end
 
parser = PersonParser.new('people.csv')
parser.people
parser.save

puts "There are #{parser.people.size} people in the file '#{parser.file}'."