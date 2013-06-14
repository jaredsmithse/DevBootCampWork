# no original gist

module SuperPowers

  def user_laser_vision
    @magic_points = 5000
  end
end


class Animal
  include SuperPowers
  attr_accessor :magic_points
  attr_reader :num_legs
  def initialize
    @num_legs = 4
    @magic_points = user_laser_vision
  end
end

class Mammal < Animal
  attr_reader :warm_blooded
  def initialize(warm_blooded = true)
    @warm_blooded = warm_blooded
    
  end
end

class Primate < Mammal
  def initialize
    super
    @num_legs = 2
  end
end


class Bat < Mammal
  def initialize
    @num_legs = 2
  end
end

class Amphibian < Animal; end
class Frog < Amphibian; end
class Chimpanze < Primate; end

primate = Primate.new
p primate.warm_blooded

frog = Frog.new
p frog.num_legs
p frog.magic_points