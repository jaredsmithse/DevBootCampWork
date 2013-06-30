# original gist : https://gist.github.com/ff895551ad344657285a

# Returns all prime numbers <= n
def eratosthenes_sieve(n)
	range = (2..n).to_a
	(2..Math.sqrt(n)).each do |possible_prime|
		range.reject! {|num| num % possible_prime == 0 && num != possible_prime }
	end
	range
end
p eratosthenes_sieve(120)
# Returns all prime factors of n, using the Sieve of Erastothenes
# Note: you most likely won't call eratosthenes_sieve from inside
# this method.  Instead, you'll need to augment the logic of
# eratosthenes_sieve to make it return prime factors
def prime_factors(n)
	primes = eratosthenes_sieve(n)
	prime_factors, index = [], 0
	until n == 1
		if n % primes[index] == 0
			prime_factors << primes[index]
			n /= primes[index]
			index = 0
		else
			index += 1
		end
	end
	prime_factors
end

p prime_factors(120)