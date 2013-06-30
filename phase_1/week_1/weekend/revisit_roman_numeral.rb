# 1: Grab a solution to Roman Numerals
# 
# Source: https://gist.github.com/laumontemayor/dffee8d8b406988760cb
# Author: Chantal, Laura
 
# ------------
# 2. Explain the code in plain English

# First, a list of the roman numerals is made that has the symbol and its
# number translation. Starting with the largest number, it makes the roman 
# numeral while taking the value off of the passed in number. For example,
# with 125 it goes to 'C' first ('C' is for 100) and builds the first part 
# of the roman numeral and subtracts from the given number. After this first
# step we have "C" and 25, and then we continue for the remainder until we 
# have 0 and the roman numeral.
 
 
# ------------
# 3. Translate to pseudocode

# Have a list of roman numerals and their corresponding numbers
# Have a blank string to start building the roman numeral with
# Go through each number and roman translation pair in the list,
# starting from the largest and working down in order
# 	Add the roman translation n times to our string, n being the
# 	given number divided by the current roman number value we are 
# 	on (floor division)
# 	Reset our given number to itself modulo the roman number value
# End the loop
# Return our new string
 
 
# ------------
# 4. Test the code

# # Test the base case
# puts to_roman(1) == "I"

# # Test to make sure the special conditions work
# puts to_roman(440) == "CDXL"

# # Testing for a large number in the new way
# puts to_roman(4_734) == "MMMMDCCXXXIV"
 
# ------------
# 5. Refactor
#
# Write the refactored method below. 
# Comment out the original so that your tests are run 
# against the refactored version.

NEW_WAY = { 
		1000 => 'M',
		900 =>  'CM',
		500 =>  'D', 
		400 =>  'CD',
		100 =>  'C', 
		90 =>   'XC',
		50 =>   'L', 
		40 =>   'XL',
		10 =>   'X',
		9 =>    'IX',
		5 =>    'V', 
		4 =>    'IV',
		1 =>    'I' 
	}

OLD_WAY = { 
		1000 => 'M',
		500 =>  'D', 
		100 =>  'C', 
		50 =>   'L', 
		10 =>   'X',
		5 =>    'V', 
		1 =>    'I' 
	}
### Refactor 1 ###
# I have created two lists, one for the old way and
# one for the new way. By default the new way is used
# and I have changed the code accordingly

### Refactor 2 ###
# Since the list is unchanging, it should be declared
# as a constant outside of the method.

def to_roman(num, way = "new")
  
	roman_string = ""

	if way == "new"
		NEW_WAY.each do |number, roman| 
			roman_string += roman * (num/number)	
			num %= number 
		end
	elsif way == "old"
		OLD_WAY.each do |number, roman| 
			roman_string += roman * (num/number)	
			num %= number 
		end
	else
		raise "We don't know how to convert that way"
	end
    
	roman_string
end

# Test the base case
puts to_roman(1) == "I"

# Test the old way
puts to_roman(440, 'old') == "CCCCXXXX"

# Test the new way
puts to_roman(440) == "CDXL"

# Testing for a large number in the new way
puts to_roman(4_734) == "MMMMDCCXXXIV"
