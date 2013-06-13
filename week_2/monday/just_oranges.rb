# original gist : https://gist.github.com/da30c4f06ba499c7e568

class NoOrangesError < StandardError
end

class OrangeTree
  attr_reader :age, :height

  def initialize
    @age = 0
    @height = 0
    @oranges_on_tree = 0
  end

  def age!
    @age += 1

    case @age
      when 1 || 2
        @height += 4
      when 3
        @height += 3
      when 4..6
        @height += 2
        @oranges_on_tree += 12
      when 7..9
        @height += 1
        @oranges_on_tree += 16
      when 10..29
        @oranges_on_tree += 18
    end
  end

  def dead?
    @age > 30
  end

  def any_oranges?
    @oranges_on_tree > 0
  end

  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    @oranges_on_tree -= 1
    Orange.new(2 + rand(4))
  end

end


class Orange
  
  attr_reader :diameter

  def initialize(diameter)
    @diameter = diameter
  end

end


### Driver Code ###

tree = OrangeTree.new

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  # It places the oranges in the basket
  # IT PLACES THE ORANGES IN THE BASKET
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  avg_diameter = 0

    basket.each do |orange|
      avg_diameter += orange.diameter
    end

  avg_diameter /= basket.size.to_f unless basket.empty?
  avg_diameter = avg_diameter.round(2)

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"