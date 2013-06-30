require './parser'
require './deck'
require './card'
require './printdialogue'


class FlashCards
  include PrintDialogue

  def initialize
    @parser = Parser.new('./flashcard_samples.txt')
    @deck = @parser.read_in_cards
    @current_card = nil
    @input = ""
    @wrong_limit = 0
    game_start
    play_game
  end

  def play_game
    play_card
    while true
      if @current_card.is_answer?(@input)
        correct_answer
        play_card
      elsif @input == "answer"
        gave_up
        @current_card.print_answer
        play_card
      elsif @input == "fuck you"
        naughty_words
        @input = gets.chomp
      elsif @input == "exit"
        break
      elsif @input == "hint"
        print_hint(@current_card.give_hint)
        @input = gets.chomp
      else
        wrong_answer
        @wrong_limit += 1
        @wrong_limit >= 3 ? play_card : @input = gets.chomp
      end
    end
  end

  def play_card
    @current_card = @deck.get_card
    @current_card.print_definition
    @input = gets.chomp
    @wrong_limit = 0
  end


end

game = FlashCards.new
