# no original gist

require "benchmark"

def linear_search (object, array)
  index = 0
 
  until index >= (array.length)
    return index if array[index] == object
    index += 1
  end
 
  return nil
end
 

def binary_search (object, array)
  low = 0
  high = (array.length - 1)
  
  while low <= high
    i = (low + high) / 2
    if array[i] < object 
      low = i + 1
      next  
    end
    if array[i] > object
      high = i -1
      next
    end
    return i
  end
  return -1;
end

test_array1 = (1..1000).to_a
test_array2 = (1..10000).to_a
test_array3 = (1..1000000).to_a

test1 = 501
test2 = 5001
test3 = 500001

# Benchmark.TESTS = 3
Benchmark.bmbm do |results|
  results.report("linear 1,000(small)") {linear_search(test1, test_array1)}
  results.report("binary 1,000(small)") {binary_search(test1, test_array1)}
  results.report("index 1,000(small)") {test_array1.index(test1)}

  results.report("linear 10,000(medium)") {linear_search(test2, test_array2)}
  results.report("binary 10,000(medium)") {binary_search(test2, test_array2)}
  results.report("index 10,000(medium)") {test_array2.index(test2)}

  results.report("linear 1,000,000(large)") {linear_search(test3, test_array3)}
  results.report("binary 1,000,000(large)") {binary_search(test3, test_array3)}
  results.report("index 1,000,000(large)") {test_array3.index(test3)}
end
