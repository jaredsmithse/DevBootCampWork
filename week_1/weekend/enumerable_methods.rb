### Array#map ###
# Map sends each element in the list to a 
# block and builds a new array of return 
# values from that block.


### Array#inject ###
# Inject acts like an accumulator by taking in 
# a starting value and adding on to it. This 
# returns a single value when finished.


### Array#select ###
# Select takes a block that evaluates to true
# or false and returns a list of items from the
# given list that evaluate to true.


class Array
	def my_map
		new_array = []
		self.length.times do |i|
			new_array << yield(self[i])
		end
		new_array
	end
end

puts [1,2,3,4].my_map { |i| i -= 1 }  == [0,1,2,3] # makes you count like a programmer!