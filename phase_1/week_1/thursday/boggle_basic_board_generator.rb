# original gist : https://gist.github.com/c2c3726b829ab3ebb2c4

DICE = [
  "AAEEGN",
  "ELRTTY",
  "AOOTTW",
  "ABBJOO",
  "EHRTVW",
  "CIMOTU",
  "DISTTY",
  "EIOSST",
  "DELRVY",
  "ACHOPS",
  "HIMNQU",
  "EEINSU",
  "EEGHNW",
  "AFFKPS",
  "HLNNRZ",
  "DEILRX"]
class BoggleBoard
  def initialize
    @original_board = Array.new(16)
    @game_board = Array.new(16)
    generate_board 
  end

  def generate_board
    @original_board.each_with_index do |column,index|
      @original_board[index] = Array.new
    end

    @original_board.each_with_index do |square, index|
      @original_board[index] = DICE[index]
      @game_board[index] = '_'
    end

  end
  
  def shake!
    @original_board.shuffle!
    @original_board.each_with_index do |dice,index|
      @game_board[index] = dice.split('').sample
    end
    @game_board
  end
  
  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  #
  # Override this to print out a sensible board format so
  # you can write code like:
  #
  # board = BoggleBoard.new
  # board.shake!
  # puts board
  def to_s
    @game_board.each_slice(4).each do |line|
      puts line.join(' ')
    end
  end
end