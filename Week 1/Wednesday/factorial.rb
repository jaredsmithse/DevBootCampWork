# original gist : https://gist.github.com/299a49271c1616c15f3b

# Implement an iterative version of the factorial function
def factorial_iterative(n)
  product = 1
  (2..n).each do |iter|
    product *= iter
  end
  product
end
factorial_iterative(3)
 
# Implement a recursive version of the factorial function
def factorial_recursive(n)
  return 1 if n < 2
  n * factorial_recursive(n-1)
end