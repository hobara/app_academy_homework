class HumanPlayer

  def initialize
    @player
  end

  def get_guess
    puts "Choose a card"
    print "Row: "
    row_input = gets.chomp
    print "Column: "
    column_input = gets.chomp
    pos = [row_input.to_i - 1, column_input.to_i - 1]
  end

  def recieve_revealed_card(pos, value)
  end

  def recieve_match(pos1, pos2)
  end

end
