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
		# > code taken from tutorial
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

	### inheritance ##
	# # Inheritance is using the methods and attributes of another class to
	# # define new kinds (but still similar) of classes. In my example, you 
	# # would have a Human class that Parent and Child inherit from.
	# class Human
	# 	def initialize(gender, hair_color, age = 0)
	# 		@age = age
	# 		@hair_color = hair_color
	# 		@gender = gender
	# 	end
	# end
	#
	# def Parent < Human
	# end
	#
	# def Child < Human
	# end

	### composition ##
	# # Composition is a way of design where objects are made up of other objects.
	# # In the people problem space it would be each person is an arm, a leg, 
	# # a head, etc.
	# class Human
	# 	def initialize(head, arm, leg, torso)
	# 		@head = head
	# 		@arm = arm
	# 		@leg = leg
	# 		@torso = torso
	# 	end
	# end

	## reasoning ##
	# In this problem space I think that inheritance would be better. There are many
	# different kinds of people and they are all made up of the same parts. Only in 
	# the case of evolution would we need to keep track of these parts on a low level.

####################
### going deeper ###
####################

	### Single Responsibility/Separation of Concerns ##
	# # These concepts are about your methods and classes not doing too much and
	# # not having a 'god class' or a blob. Methods should only have one thing 
	# # they do and classes should hold what they need to.
	#
	# #before
	# class Parent
	# 	def sleep
	# 		if child.awake == false
	# 			awake = false
	# 		end
	# 	end
	# end
	# class Child
	# 	attr_reader :awake
	# 	def initialize
	# 		@awake
	# 	end
	#
	# #after
	# class Parent
	# 	def sleep
	# 		awake = false if child.asleep?
	# 	end
	# end
	# class Child
	# 	def initialize
	# 		@awake
	# 	end
	# 	def asleep?
	# 		true unless @awake
	# 	end
	# end

	### Reducing Dependencies/Decoupling Objects ##
	# # Decoupling of your classes is making them more autonomous. An advantage to 
	# # this is when you make changes to your code and it breaks you can easily
	# # trace how the objects are interacting if there is less interaction. This 
	# # by nature makes the likeliness of your code breaking during change lower.
	#
	# #before
	# class Parent
	# 	def ask_permission(child_sender)
	# 		true unless child_sender.has_been_naughty?
	# 	end
	# end
	# class Child
	# 	def jump_on_bed
	# 		jumping_on_bed = true if parent.ask_permission(self)
	# 	end
	# end
	#
	# #after
	# class Parent
	# end
	# class Child
	# 	def jump_on_bed
	# 		jumping_on_bed = true
	# 	end
	# end