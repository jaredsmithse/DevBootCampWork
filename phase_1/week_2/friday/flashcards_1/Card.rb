class Card
	attr_reader :definition, :word
	def initialize(definition, word)
		@definition = definition
		@word = word
	end

  def print_answer
    print "Answer: #{@word} \n\n"
  end

  def print_definition
    puts "Definition: #{@definition}"
  end

	def is_answer?(potential_answer)
		@word == potential_answer
	end

	def give_hint
		@word[0]
	end

end

