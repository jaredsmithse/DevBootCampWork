# no original gist

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