# original gist : https://gist.github.com/1a821458079731afc66b

class Company
  attr_accessor :company_name
  attr_reader :employees
   
  def initialize(name)
    @company_name  = name
    @employees   = []
  end
 
  def add_employee(employee)
    @employees << employee
  end
 
end
 
 
class Employee
  attr_accessor :name, :position
  attr_reader :id

  def initialize(name, position)
    @name     = name
    @position = position
    @id       = rand(100_000_000).to_s.insert(2, '-').insert(6, '-')
  end
 
end
devbootcamp = Company.new("Dev Bootcamp")

shereef = Employee.new("Shereef Bishay", "Master Of The Bootiverse")

devbootcamp.add_employee(shereef)

puts (p "#{devbootcamp.company_name} - #{devbootcamp.employees.first.name}: #{devbootcamp.employees.first.position}") == "Dev Bootcamp - Shereef Bishay: Master Of The Bootiverse"

shereef.name = "Not Jesse Farmer"
shereef.position = "Master of Everything"

devbootcamp.company_name = "Dev Kick your Butt Camp"

puts (p "#{devbootcamp.company_name} - #{devbootcamp.employees.first.name}: #{devbootcamp.employees.first.position}") == "Dev Kick your Butt Camp - Not Jesse Farmer: Master of Everything"