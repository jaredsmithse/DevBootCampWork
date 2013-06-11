
class Student
	include Comparable

	attr_accessor :scores, :name, :average, :letter_grade, :ssn

	def initialize(name, scores, ssn)
		@name = name
		@scores = scores
		@average = compute_average
		@letter_grade = compute_letter_grade
		@ssn = ssn
	end

	def compute_average
		@scores.inject(:+) / 5
	end

	def compute_letter_grade
		case 
		when @average >= 90 then @letter_grade = "A"
		when @average >= 80 then @letter_grade = "B"
		when @average >= 70 then @letter_grade = "C"
		when @average >= 60 then @letter_grade = "D"
		when @average < 60 then @letter_grade = "F"
		end
	end

	def <=> other
		self.ssn <=> other.name
	end
	
end

def linear_search(array, name)
	array.each_with_index do |student, index|
		student.name == name ? (return index) : (return -1)
	end
end

def binary_search(array, ssn)
	low = 0
	high = (array.length - 1)

	while low <= high

		half_point = (low + high) / 2

		if array[half_point].ssn < ssn 
			low = half_point + 1
			next  
		end

		if array[half_point].ssn > ssn
			high = half_point -1
			next
		end

		return half_point
	end

	return -1;
end

students = []
students << Student.new("Alex", [100,100,100,0,100], "111-11-1111")
students << Student.new("John", [95,75,90,50,80], "121-21-2222")
students << Student.new("Jow", [70,80,90,90,100], "131-31-3333")
students << Student.new("Jared", [100,100,100,100,100], "141-41-4444")
students << Student.new("Colleen", [70,100,50,800,100], "141-51-5555")

p students[0].name == "Alex"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0

p students[0].average == 80
p students[0].letter_grade == 'B'

p linear_search(students,"Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1

students.sort
p students[0].ssn <  students[1].ssn
p students[3].ssn >  students[0].ssn

p binary_search(students,"111-11-1111") == 0
p binary_search(students, "000-00-0000") == -1


