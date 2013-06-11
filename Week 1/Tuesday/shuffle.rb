# original gist : https://gist.github.com/00c978ee83bc6178b1c1

def shuffle(array)
  array.size.times do |index|
    temp_holder = array.delete_at(index)
    array.insert(Random.rand(array.size), temp_holder)
  end
  array
end


# Driver code:
sorted_array = (1..10).to_a

# This should print a different sequence of numbers each time
p shuffle(sorted_array)
p shuffle(sorted_array)
p shuffle(sorted_array)