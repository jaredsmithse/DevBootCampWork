### Things I learned this week (in no specific order): ###

# 1. Recursion
# 2. Iteration
# 3. Extending classes
# 4. Scoping
# 5. Data Structures
# 6. Looping
# 7. Style Guidelines
# 8. File input
# 9. Benchmarking
# 10. Searching

### Extending classes ###

# This week we worked with extending a class so that we could use it easily with an object.
# If we open the class and write (or rewrite) a method, a good advantage is that we do not
# need to pass in that object anymore becuase it is passed in by default. With this comes
# the need to use dot notation as well. I learned also that you do not want to open the 
# built-in classes of Ruby as it is bad practice, so opening classes tends to be used only
# for extending our own classes that we wrote ourselves.
# Example:
class my_array
	def initialize
		ar = []
	end
	# better printing
	def to_s
		print "The array has : "
		ar.each_with_index do |element, index|
			index == ar.size - 1 ? print element : print element + ", "
		end
		puts
	end
end

### Style guidelines ###

# For one of our challenges this week we read over an article that outlined some of the best
# practices we should be following with our ruby code. Coming from a predominantly Java
# background, I had to make some changes. The largest change was for variables. In ruby,
# the way you name variables are in snake case like_this as opposed to camel case likeThis.
# Also, it is encouraged to make your variables longer and more descriptive so the code is 
# more readable since the optimal ruby code is the kind you can read without the need for
# actual comments.

