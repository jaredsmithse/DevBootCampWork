# no original gist

# Solution for Challenge: Debugging Drill: Read the Error. Started 2013-06-04T00:32:20+00:00
##1##
def mean(numbers)
  sum = numbers.inject(:+)
  sum / numbers.length
end

# This will throw an error. Change this line so that it works.
sample_avg = mean([5, 3, 6, 10])


##2##
def mean(*numbers)
  sum = numbers.inject(:+)
  sum / numbers.length
end

# This will throw an error. Change this line so that it works.
sample_avg = mean(5, 3, 6, 10)


##3##
def print_and_sort(array)
  output_string = ""
  array.each do |element|
    element.nil? ? element = "":element
    output_string = output_string + " " + element.to_s
  end
  puts output_string
  array.map! {|x| x.to_s}
  array.sort
end