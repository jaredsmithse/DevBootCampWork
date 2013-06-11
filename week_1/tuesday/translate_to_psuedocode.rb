# original gist : https://gist.github.com/ae920deb280f6b7b7e98

# The grid is an array of arrays contianing
# rocks and gold, something like this:
# [ ['R', 'R', 'G'],
#   ['R', 'G', 'R'],
#   ['R', 'G', 'G'] ]

def pick_up_the_gold(grid)
  gold_sachel = []
  x, y        = 0, 0

  while y < grid.length
    current_sq  = grid[y][x]
    
    if current_sq == 'G'
      gold_sachel.push 'G'
      grid[y][x] = 'R'
    end
    
    if x == (grid[y].length - 1)
      x = 0
      y += 1
    else
      x += 1
    end
  end
  
  raise "Oops, looks like we missed one" if grid.include? 'G'
  
  puts "You picked up #{gold_sachel.count} pieces of gold!"
end

# __________________________
# start method, take in a 2D array
#   make a gold sachel to store found treasure
#   set the starting coordinates to 0,0

#   loop through every coordinate:
#     set the current square we're on

#     if there is a letter 'G' (G for Gold)
#       put it in the sachel
#       replace the G with an R (R for Rock)

#     check if x coordinate is at it's limit
#       if it is, set back to zero for next row
#       increment y to start next row
#     if x is not at the end of the row
#       increment x to move to the right one square

#   if we finish and there is still gold, raise an error

#   tell the user how rich he/she now is (with amount)

