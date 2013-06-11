# no original gist

def prime_factors (dividend)
  prime_divisors = []
  return [1] if dividend == 1
  potential_prime_divisor = 2
  until dividend == 1
    if dividend % potential_prime_divisor == 0 
      prime_divisors << potential_prime_divisor
      dividend /= potential_prime_divisor
    else
      potential_prime_divisor += 1
    end  
  end
  prime_divisors
end