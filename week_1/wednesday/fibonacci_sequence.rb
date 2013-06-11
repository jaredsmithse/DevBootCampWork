# original gist : https://gist.github.com/6d52a07667a46f61ca8b

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
  return 1 if n == 1
  return 0 if n == 0
  fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
end