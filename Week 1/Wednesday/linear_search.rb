# no original gist

def linear_search (object, array)
  index = 0

  until index >= (array.length)
    return index if array[index] == object
    index += 1
  end

  return nil
end

def global_linear_search(object, array)
  index = 0
  matching_indeces = []
  until index >= (array.length)
    matching_indeces << index if array[index] == object
    index += 1
  end

  matching_indeces.empty? ? (return nil) : (return matching_indeces)
end