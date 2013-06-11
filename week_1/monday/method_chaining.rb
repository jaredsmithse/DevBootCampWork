# original gist : https://gist.github.com/e83e9d0750ac1d5cd264

# TODO: Refactor for elegance
def shout_backwards(string)
  string.upcase.reverse + "!!!"
end


# FIXME: This is convoluted. Refactor for clarity.
def squared_primes(array)
  find_primes = array.find_all do |x| 
    factors = (2..x-1).select() do |i|
      x % i == 0
    end
    p factors.count == 0 
  end
  find_primes.map{|p| p*p}
end

# Driver code... don't edit. This should print a bunch of trues.
puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]