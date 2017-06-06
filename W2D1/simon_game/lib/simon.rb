class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq, :answer

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @answer = []
  end

  def play
    puts "Welcome to simon game!"
    while @game_over == false || @sequence_length < 30
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    p @seq
    sleep(1)
    system('clear')
    require_sequence
    # puts "answer is #{@answer} and seq is #{@seq}"
    @seq == @answer ? @game_over = false : @game_over = true
    if @game_over != true
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Type the sequence."
    @answer = []
    @seq.length.times do |i|
      print "#{i+1}: "
      answer = gets.chomp
      if valid?(answer)
        @answer << answer.downcase
      else
        puts "Invalid color!"
        sleep(1)
        system('clear')
        p @seq
        sleep(1)
        system('clear')
        require_sequence
      end
    end
  end

  def valid?(color)
    COLORS.include?(color)
  end

  def add_random_color
    @seq << COLORS[rand(0..3)]
  end

  def round_success_message
    puts "Success!"
    sleep(1)
    system('clear')
  end

  def game_over_message
    puts "Game over! You made #{@sequence_length-1} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

end

# if __FILE__ == @PROGRAM_NAME
  a = Simon.new
  a.play
# end
