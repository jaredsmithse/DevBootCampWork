class Deck
  attr_reader :deck

  def initialize(deck)
    @deck = deck    
  end

  def get_card
    @deck.shuffle.pop  
  end

  def cards_left?
    @deck.length > 0
  end

end
