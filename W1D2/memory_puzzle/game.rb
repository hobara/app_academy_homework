require_relative 'card'
require_relative 'board'
require_relative 'human_player'
# require_relative 'computer_player'

class Game
  def initialize(difficulty, player)
    @board = Board.new(difficulty)
    @player = player
    # @player.set_difficulty(@board.difficulty)
  end

  def play
    until @board.won?

      @board.render
      first_pos = @player.get_guess
      first_guess = @board.reveal(first_pos)
      @player.recieve_revealed_card(first_pos, first_guess)

      @board.render
      second_pos = @player.get_guess
      second_guess = @board.reveal(second_pos)
      @player.recieve_revealed_card(second_pos, second_guess)
      @board.render

      if first_guess != second_guess
        @board[first_pos].hide
        @board[second_pos].hide
        sleep(1)
      else
        @player.recieve_match(first_pos, second_pos)
      end
    end
    puts "You completed!"
  end
end

if __FILE__ == $PROGRAM_NAME
  a = HumanPlayer.new
  print "Type a game level on a scale from 1 to 3: "
  level = gets.chomp.to_i
  game = Game.new(level, a)
  game.play
end
