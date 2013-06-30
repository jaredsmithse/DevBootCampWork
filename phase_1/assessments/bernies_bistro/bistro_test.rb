# original gist : https://gist.github.com/dbc-challenges/3247ba09cef79aa969a7

require_relative('bistro')



bistro = Bistro.new
bistro.load_recipes("recipes.csv")

bistro.print_list

puts bistro.find_recipe_by_id(2)
puts bistro.find_recipe_by_id(0)
puts bistro.find_recipe_by_id(20)
