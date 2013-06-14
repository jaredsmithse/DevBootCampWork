# original gist : https://gist.github.com/dbc-challenges/ac251b616f360ec53fc9

class RationalNumber
  attr_reader :numerator, :denominator
  
  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end
  
  # Addition
  def +(rational)
  	new_numerator = @numerator * rational.denominator + @denominator * rational.numerator
  	new_denominator = @denominator * rational.denominator
  	RationalNumber.new(new_numerator, new_denominator)
  end
  
  # Subtraction
  def -(rational)
  	new_numerator = @numerator * rational.denominator - @denominator * rational.numerator
  	new_denominator = @denominator * rational.denominator
  	RationalNumber.new(new_numerator, new_denominator)
  end
  
  # Multiplication
  def *(rational)
  	new_numerator = @numerator * rational.numerator
  	new_denominator = @denominator * rational.denominator
  	RationalNumber.new(new_numerator, new_denominator)
  end
  
  # Division
  def /(rational)
  	self.reciprocal * rational
  end
  
  # Exponentiation
  def **(integer)
  	@numerator = @numerator ** integer
  	@denominator = @denominator ** integer
  end
  
  # The reciprocal, with an example
  def reciprocal
    RationalNumber.new(self.denominator, self.numerator)
  end
  
  # For, e.g., 1/3 should return -1/3
  # That is, rat + rat.inverse == RationalNumber(0,1)
  def inverse
  	@numerator *= -1
  end
  
  # Returns true if this rational is equal the the input
  # Remember that RationalNumber.new(1,2) == RationalNumber(2,4)
  def ==(rational)
  	@numerator * rational.denominator == @denominator * rational.numerator
  end
  
  def to_s
    "(#{self.numerator}/#{self.denominator})"
  end
end