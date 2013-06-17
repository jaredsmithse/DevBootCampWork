# original gist : https://gist.github.com/dbc-challenges/b370e62cd0a0115f6e61

# This gist has a lot of variables in it, all of which are VERY poorly named!
# Your goal is to understand and define the scope of each variable.

$var_1 = 22

class Person
  @@var_2
	VAR_6 = "Ruby"

	attr_reader :var_3, :var_4

	def initialize(var_5 = VAR_6)
	  @var_3="Law of Demeter"  
	end

	def do_stuff(var_7=[1,2,3])
		var_9 = 0 #needs to be initialized before being used
	  var_7.each do |var_8|
	    var_9 += var_8 + 2
	  end
	end
end

person = Person.new($var_1)
puts person.do_stuff

# Part 1: Describe each variable scope.

# 1. $var_1 is a global variable which is defined as an accessor for an integer value
# 2. @@var_2 is a class variable which is defined as a part of the Person class
# 3. @var_3 is an instance variable which is defined as part of the Person class to hold a string
# 4. var_4 is an instance variable which is defined as a read only variable accessible outside the class
# 5. var_5 is a local variable which is defined as an argument pased in to Person for initialization
# 6. VAR_6 is a constant variable which is defined as a default value for var_5 if one is not provided
# 7. var_7 is a local variable which is defined as an argument for the do_something method and has a default value
# 8. var_8 is a local variable which is defined as the name for elements in the var_7 array
# 9. var_9 is a local variable which is defined as an accumulator to add up the numbers in the var_7 array


# Part 2: Driver code to write to and output each variable.

puts $var_1
$var_1 = 21
puts $var_1
puts

puts person.var_3
puts 

puts person.var_4

# In the challenge description you said to show each variable and to modify the code 
# if necessary to ensure that every variable was accessed and able to be modified. You
# then went on to say that if we modified the code we could not change the scope of the 
# variable. If I change the code to make a variable accessible from the driver code then
# I have by definition changed the scope of that variable. In light of that, if I cannot 
# access it from the driver code then I cannot modify it either (although I can't modify
# VAR_6 at all because it is a constant).