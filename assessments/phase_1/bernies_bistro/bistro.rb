# original gist : https://gist.github.com/dbc-challenges/3247ba09cef79aa969a7

require 'csv'

class Recipe
  attr_accessor :id, :name, :description, :ingredients, :directions

  def initialize(attributes)
    @id = attributes[0]
    @name = attributes[1]
    @description = attributes[2]
    @ingredients = attributes[3].split(', ')
    @directions = attributes[4]
  end

  def print
    puts "#{@id} - #{@name}"
    puts "#{@description} "
    puts
    puts "Ingredients: "
    puts "#{@ingredients.join(', ')} \n"
    puts
    puts "Preparation Instructions:"
    puts @directions
  end

  def to_a
    [@id,@name,@description,@ingredients,@directions]
  end
end

class Bistro
  def initialize
    @recipes = []
  end

  def load_recipes(filename)
    
    @recipes = []
    CSV.foreach(filename, 'r') do |line|
      next if line[0] == "id"
      @recipes << Recipe.new(line)
    end
    @recipes

  end

  def find_recipe_by_id(recipe_id)
    raise "Can't find a recipe with an id of #{recipe_id.inspect}" unless @recipes[recipe_id-1]
    @recipes[recipe_id-1].print
  end

  def print_list
    @recipes.each {|recipe| puts "#{recipe.id}. #{recipe.name}"}
  end
end




if ARGV.any?

  bistro = Bistro.new
  bistro.load_recipes("recipes.csv")

  case
  when "list" then bistro.print_list
  when "display" then puts bistro.find_recipe_by_id(ARGV[1].to_i)
  end
end