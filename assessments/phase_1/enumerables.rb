class Array

	### #map ###
	# Map iterates over the array, running the given code (block) 
	# once on each item it comes across. These new values are 
	# given back in a new array.
	def my_map
		new_array = []
		self.length.times do |i|
			new_array << yield(self[i])
		end
		new_array
	end

	### #group_by ###
	# Select will go through each item in a given list and give you back 
	# a list of all the elements that match the criteria you specify in 
	# your block.
	def my_select
		new_array = []
		self.length.times do |i|
			new_array << self[i] if yield(self[i])
		end
		new_array
	end


	### #group_by ###
	# Group_by is very similar to the group_by you would use in SQL 
	# statements. It will run the given code (block) on each element,
	# and then take all the elements that had the same answer and return
	# them in one array (and put that in an array with the other groups).

	### #inject ###
	# Inject can take a list of items and join them together in 
	# whichever way you want. You can add, subtract or perform any
	# other operation or code to the elements. You pass in the operator
	# as a symbol, but you could also instead pass in an accumulator
	# variable and specify the operations when you write your code in
	# the included block.
end

### Tests ###

array1 = [1,2,3,4,5,6,7,8,9]
array2 = ['a','b','c','d']

puts array1.my_map { |x| x**2 } == array1.map { |x| x**2 }
puts array1.my_map { |x| x.odd? } == array1.map { |x| x.odd? }
