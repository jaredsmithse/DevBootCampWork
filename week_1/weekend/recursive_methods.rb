def choose_team(n, k)
	return 0 if n ==0
	return n if k == 1 
	ways = choose_team(n-1,k-1) + choose_team(n-1,k)
end

puts choose_team(6,2) == 15
puts choose_team(6,3) == 20
puts choose_team(24,4) == 10626