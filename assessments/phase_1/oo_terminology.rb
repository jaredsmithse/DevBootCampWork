# no original gist

###################
### Definitions ###
###################

		### attr_reader, writer, accessor ##
		# # The three attribute accessor methods do as they say. The attr_reader makes
		# # instance variables accessible for reading outside the class while the attr_writer
		# # allows for modifying variables that are within the class. Attr_accessor allows
		# # for you to do both without having to list each variable twice. These get rid of 
		# # the necessity to write explicit getter and setter methods.
		# class Parent
		# 	#this...
		# 	attr_accessor :name
		# 	#and this...
		# 	attr_reader :age
		# 	def initialize(name, age)
		# 		@name = name
		# 		@age = age
		# 	end
		#
		# 	# ...replaces this
		# 	def name
		# 		@name
		# 	end
		# 	def name=(new_name)
		# 		@name = new_name
		# 	end
		#
		# 	# ...and this
		# 	def age
		# 		@age
		# 	end
		# end

		## instance and class methods ##
		# Instance methods change or modify that instance's internal state while a class
		# method performs a certain operation without the need for that class to be
		# instantiated. An example would be whenever you use YourClass.new or Math.sqrt(n).

		class Person

		end



		### instance and class variables ##
		# # Instance variables are different across instances of an object whereas a class
		# # variable is the same across instances and if one class updates that variable, 
		# # then every other class now has that updated variable.
		#
		# class Child
		# end
		#
		# # In the 'real world' this may not exactly be necessary but I find this 
		# # to be one of the only applications to the problem space. When one twin
		# # ages, all of them age
		# class Twin < Child
		# 	@@age = 0
		# 	def get_older
		# 		@@age += 1
		# 	end
		# end

		### public and private methods ##
		# # Public methods are methods that can be accessed from outside of the class where.
		# # Private methods make the method only accessible from within the class itself.
		# # Protected, which is worth noting, is like private but can be calle from inheriting
		# # classes and other instances of that same class. Below is an example demonstrating
		# # the differences.
		#
		# class Parent
		#   private #change to protected to test differences
		#   def name
		#     'Mommy'
		#   end
		# end
		#
		# class Child < Parent
		#   def get_parent_name
		#     # Implicit receiver
		#     puts name
		#
		#     # Explicit receiver
		#     puts self.name rescue puts 'NoMethodError'
		#
		#     # Explicit receiver
		#     puts Child.new.name rescue puts 'NoMethodError'
		#   end
		# end
		#
		# #Child.new.get_parent_name
		# ## with private ##
		# # => Mommy
		# # => NoMethodError
		# # => NoMethodError
		# ## with protected ##
		# # => Mommy
		# # => Mommy
		# # => Mommy
##################################
### inheritance or composition ###
##################################





























