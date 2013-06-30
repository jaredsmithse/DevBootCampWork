# no original gist

require 'Matrix'

class Sudoku
  attr_accessor :board

  def initialize(board_string)
    string_array = board_string.split('').map{|x| x.to_i}.each_slice(9).to_a
    @board = Matrix.rows(string_array)
  end


  def solved?
    true unless @board.to_a.flatten.include?(0)
  end

  def get_minor(row, col)
    row_range = ((row / 3) * 3)..((row / 3) * 3 + 2)
    col_range = ((col / 3) * 3)..((col / 3) * 3 + 2)
    @board.minor(row_range, col_range)
  end

  def get_possibilities(row, col)
    ((1..9).to_a) - (@board.row(row).to_a) - (@board.column(col).to_a) - (get_minor(row, col).to_a.flatten)
  end

  def print_board
    @board.to_a.each_with_index do |row, row_index|
      row.each_with_index do |elem, col_index|
        if col_index == 3 || col_index == 6
          print " | "
        end
        print elem.to_s + " "
      end
      puts
      if row_index == 2 || row_index == 5
        puts "-------+--------+-------"
      end
    end
  end

  def solve!
    until solved?
      @board.each_with_index do |val, row, col|
        if val == 0
          possibilities = get_possibilities(row, col)
          if possibilities.size == 1
            board_array = @board.to_a
            board_array[row][col] = possibilities[0]
            @board = Matrix.rows(board_array)
          end
        end
      end
    end
    print_board
  end

end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
# board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new('003020600900305001001806400008102900700000008006708200002609500800203009005010300')

# Remember: this will just fill out what it can and not "guess"
game.solve!

