require_relative 'board'

class Game
  def initialize
    @board
  end

  def play
    puts "Let's play sudoku!"
    print "Choose a difficulty on a scale from 1 to 3: "
    level = gets.chomp.to_i
    @board = Board.new(level)
    puts "-----------"
    until @board.solved?
      @board.render
      puts "What numeber do you want to place? (on a scale from 1 to 9)"
      print ": "
      number_input = gets.chomp
      if is_valid__number_input?(number_input)
        puts "Where do you want to place? (on a scale from 1 to 9)"
        print "Row: "
        row_input = gets.chomp
        print "Column: "
        column_input = gets.chomp
        location_input = [row_input.to_i - 1, column_input.to_i - 1]
        @board.set_value(location_input, number_input)
      else
        play
      end
    end
  end

  def is_valid__number_input?(num)
    return true if (1..9).to_a.include?(num.to_i)
    false
  end


end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
