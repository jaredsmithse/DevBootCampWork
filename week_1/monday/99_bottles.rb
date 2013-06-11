# original gist : https://gist.github.com/a620c6d51519b6541bcf

# Takes as its input an integer +n+ representing the starting number of bottles
# Prints out the lyrics to "n Bottles of Beer" to the console.
def bottle_song(num)
  num.downto(1) do |beer_bottles| 
    if beer_bottles  == 1
      puts "#{beer_bottles} bottle of beer on the wall, #{beer_bottles} bottle of beer." 
      puts "Take one down, pass it around, no more bottles of beer on the wall!"
    else
      puts "#{beer_bottles} bottles of beer on the wall, #{beer_bottles} bottles of beer." 
      puts "Take one down, pass it around, #{beer_bottles-1} bottles of beer on the wall!"
    end
  end
end