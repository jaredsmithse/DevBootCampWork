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
		
		# # This is the same...
		# class BankAccount
		# 	def initialize(name)
		# 		@name = name
		# 		@balance = 0
		# 	end
		# 	def name
		# 		@name
		# 	end
		# 	def name=(new_name)
		# 		@name = new_name
		# 	end
		# 	def balance
		# 		@balance
		# 	end
		# end
		#
		# # As this...
		# class BankAccount
		# 	attr_reader :balance
		# 	attr_accessor :name
		# 	def initialize(name)
		# 		@name = name
		# 		@balance = 0
		# 	end
		# end


		## instance and class methods ##
		# Instance methods change or modify that instance's internal state while a class
		# method performs a certain operation without the need for that class to be
		# instantiated. An example would be whenever you use YourClass.new or Math.sqrt(n).

		# class BankAccount
		# 	attr_reader :balance
		# 	attr_accessor :name
		# 	def initialize(name)
		# 		@name = name
		# 		@balance = 0
		# 	end
		#
		# 	#class method
		# 	def self.create_for(name)
		# 		@accounts ||= []
		# 		@accounts << BankAccount.new(name)
		# 	end
		#
		# 	#instance method
		# 	def deposit(amount)
		# 		@balance += amount
		# 	end
		# end


		### instance and class variables ##
		# # Instance variables are different across instances of an object whereas a class
		# # variable is the same across instances and if one class updates that variable, 
		# # then every other class now has that updated variable.
		
		# class BankAccount
		# 	attr_reader :balance
		# 	attr_accessor :name
		# 	# class variable
		# 	@@number_of_accounts ||= 0
		# 	def initialize(name)
		# 		#instance variable
		# 		@name = name
		# 		@balance = 0
		# 		@@number_of_accounts += 1
		# 	end
		#
		# 	#class method
		# 	def self.create_for(name)
		# 		@accounts ||= []
		# 		@accounts << BankAccount.new(name)
		# 	end
		#
		# 	#instance method
		# 	def deposit(amount)
		# 		@balance += amount
		# 	end
		# end

		

		### public and private methods ##
		# # Public methods are methods that can be accessed from outside of the class where.
		# # Private methods make the method only accessible from within the class itself.
		# # Protected, which is worth noting, is like private but can be calle from inheriting
		# # classes and other instances of that same class. Below is an example demonstrating
		# # the differences.
		
		class BankAccount
			attr_reader :balance
			attr_accessor :name
			# class variable
			@@number_of_accounts ||= 0
			def initialize(name)
				#instance variable
				@name = name
				@balance = 0
				@@number_of_accounts += 1
			end

			#class method
			def self.create_for(name)
				@accounts ||= []
				@accounts << BankAccount.new(name) 
			end

			#instance method
			def deposit(amount)
				@balance += amount
			end

			def withdraw(amount)
				@balance -= amount unless overdrawn?
			end

			private
			def overdrawn?
				@balance < 1
			end
		
		end

		jared = BankAccount.new("Jared Smith")
		
		jared.deposit(100)
		puts jared.balance
		jared.withdraw(100)
		puts jared.balance
		jared.withdraw(10)
		puts jared.balance



##################################
### inheritance or composition ###
##################################

	### inheritance ##
	# # Inheritance is using the methods and attributes of another class to
	# # define new kinds (but still similar) of classes. In my example, you 
	# # would have a BankAccount class that CheckingAccount and SavingsAccount 
	# # inherit from.
  #
	# class BankAccount
	# 	def initialize
	# 		@name = name
	# 		@balance = 0
	# 		@@number_of_accounts += 1
	#   end
	# end
	#
	# def CheckingAccount < BankAccount
	# end
	#
	# def SavingsAccount < BankAccount
	# end

	### composition ##
	# # Composition is a way of design where objects are made up of other objects.
	# # In the case of a bank statement, it would be great to have a person object
	# # instead of just a name and a bunch of other attributes about that person.
	#
  #
	# class Person
	# 	def initialize(name, address, ssn, phone)
	# 		@name = name
	# 		@address = address
	# 		@ssn = ssn
	# 		@phone = phone
	# 	end
	# end
  #
	# class BankAccount
	# 	def initialize(person)
	# 	@owner = person
	# 	@balance = 0
	# end


	## reasoning ##
	# I think that a mix of both inheritance and composition is needed. For 
	# different kinds of accounts inheritance is great but within those accounts
	# composition works great with the case of storing people objects.

####################
### going deeper ###
####################

	### Single Responsibility/Separation of Concerns ##
	# # These concepts are about your methods and classes not doing too much and
	# # not having a 'god class' or a blob. Methods should only have one thing 
	# # they do and classes should hold what they need to.
	# before
	# class BankAccount
	# 	attr_reader :balance
	# 	attr_accessor :name
	# 	def initialize(name)
	# 		@name = name
	# 		@balance = 0
	# 		@@number_of_accounts += 1
	# 	end
	# 	def take_or_give_money(amount)
	# 		if amount > 0
	# 			@balance -= amount unless @balance < 1
	# 		else
	# 			@balance += amount
	# 		end
	# 	end
	# end
	#
	# # after
	# class BankAccount
	# 	attr_reader :balance
	# 	attr_accessor :name
	# 	@@number_of_accounts ||= 0
	# 	def initialize(name)
	# 		@name = name
	# 		@balance = 0
	# 		@@number_of_accounts += 1
	# 	end
	#
	# 	def self.create_for(name)
	# 		@accounts ||= []
	# 		@accounts << BankAccount.new(name) 
	# 	end
	#
	# 	# now we have a method for positive transactions
	# 	# and another for negative 
	# 	def deposit(amount)
	# 		@balance += amount
	# 	end
	#
	# 	def withdraw(amount)
	# 		@balance -= amount unless overdrawn?
	# 	end
	#
	# 	# we managed to abstract out a little more here
	# 	# for the sake of readability
	# 	private
	# 	def overdrawn?
	# 		@balance < 1
	# 	end
	# end

	### Reducing Dependencies/Decoupling Objects ##
	# # Decoupling of your classes is making them more autonomous. An advantage to 
	# # this is when you make changes to your code and it breaks you can easily
	# # trace how the objects are interacting if there is less interaction. This 
	# # by nature makes the likeliness of your code breaking during change later.
	#
	# #before
	class BankAccount
		attr_accessor :name, :balance
		# class variable
		@@number_of_accounts ||= 0
		def initialize(name)
			#instance variable
			@name = name
			@balance = 0
			@@number_of_accounts += 1
		end

		end
	
	end



	jared = BankAccount.new("Jared Smith")
	
	#depositing
	jared.balance += 100
	puts jared.balance
	
	#withdrawing
	jared.balance -= 100
	puts jared.balance

	#overdrawing
	jared.balance -= 10
	puts jared.balance

	
	#what if we wanted to add functionality for
	#checking if an account is overdrawn? we would 
	#have to write more driver code because we are
	#accessing the internal methods ourselves
	#depositing
	jared.balance += 110
	puts jared.balance
	
	#withdrawing
	jared.balance -= 100 unless jared.balance < 1
	puts jared.balance

	#overdrawing
	jared.balance -= 10 unless jared.balance < 1
	puts jared.balance



	# if we weren't accessing internal information
	# and performing operations on it and calling methods
	# on it, then we could change the underlying processes
	# and not break anything because the dependence on
	# BankAccount wouldn't be as strong
	#
	# #after
	class BankAccount
		attr_reader :balance
		attr_accessor :name
		# class variable
		@@number_of_accounts ||= 0
		def initialize(name)
			#instance variable
			@name = name
			@balance = 0
			@@number_of_accounts += 1
		end

		#class method
		def self.create_for(name)
			@accounts ||= []
			@accounts << BankAccount.new(name) 
		end

		#instance method
		def deposit(amount)
			@balance += amount
		end

		def withdraw(amount)
			@balance -= amount unless overdrawn?
		end

		private
		def overdrawn?
			@balance < 1
		end
	
	end

	jared = BankAccount.new("Jared Smith")
	
	jared.deposit(100)
	puts jared.balance
	jared.withdraw(100)
	puts jared.balance
	jared.withdraw(10)
	puts jared.balance

