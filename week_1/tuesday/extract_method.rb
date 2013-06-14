# original gist : https://gist.github.com/dbc-challenges/2ec0a9e0dc6fc7978890

# smells dealt with by Extract Method :
		Long Method
		Comments
		Duplicated Code
		Feature Envy - methods that call to too many objects for data
		Message Chains

# code that has the smell : 
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
# why: the method is very, very long

#cleaned up smell :
class GoldDigger
	def initialize(grid)
		@grid = grid
		@gold_sachel = []
	end

	def pick_up_the_gold
	  x, y = 0, 0

	  while y < @grid.length
	    current_sq  = @grid[y][x]
	    mine_gold if current_sq == 'G'
	    if x == (@grid[y].length - 1) ? (x,y = next_row(x,y)) : (x += 1)
	  end
	  
	  raise "Oops, looks like we missed one" if @grid.include? 'G'
	  puts "You picked up #{@gold_sachel.count} pieces of gold!"
	end

	def next_row(x,y)
		x = 0, y += 1
	end


	def mine_gold
		@gold_sachel.push 'G'
	  @grid[y][x] = 'R'
  end

end

















