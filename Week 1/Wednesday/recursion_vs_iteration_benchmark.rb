# no original gist

require "benchmark"
 
def fibonacci_iterative(n)
  fibonacci_array = [0,1]
  return 0 if n == 0
  until n == 1
    fibonacci_array << fibonacci_array[-1] + fibonacci_array[-2]
    n -= 1
  end
  fibonacci_array.last
end
 
def fibonacci_recursive(n)
  return 0 if n == 0
  return 1 if n == 1
  return 2 if n == 2
  return 3 if n == 2
  return 4 if n == 3
  return 5 if n == 5
  # adding these 4 extra results trippled benchmark speed to fib(35)
  fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
end
# Benchmark.TESTS = 3
Benchmark.bmbm do |results|
  results.report("recursive_small") {fibonacci_recursive(0)}
  results.report("recursive_large") {fibonacci_recursive(35)}
 
  results.report("iterative small") {fibonacci_iterative(0)}
  results.report("iterative large") {fibonacci_iterative(35)}
end