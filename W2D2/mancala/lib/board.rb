class Board
  attr_reader :player1, :player2
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new([]) }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      if idx == 6 || idx == 13
        # store_cups
      else
        4.times { cup << :stone }
      end
    end
    @cups
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos >= 13 || start_pos == 6 || start_pos < 0
      raise 'Invalid starting cup'
    end
    raise 'Invalid starting cup' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # render
    # moving_stones = @cups[start_pos].dup
    # @cups[start_pos] = []
    i = start_pos + 1
    until @cups[start_pos].empty?
      i = (i % 14) if i > 13
      if current_player_name == @player1
        unless i == 13
          @cups[i] << @cups[start_pos].pop
        end
      else #current_player_name == @player2
        unless i == 6
          @cups[i] << @cups[start_pos].pop
        end
      end
      i += 1
    end
    render
    next_turn(i-1, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    if current_player_name == @player1 && ending_cup_idx == 6
      :prompt
    elsif current_player_name == @player2 && ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0...6].all?(&:empty?) || @cups[7...13].all?(&:empty?)
      true
    else
      false
    end
  end

  def winner
    player1_store = @cups[6]
    player2_store = @cups[13]
    if player1_store.length == player2_store.length
      :draw
    elsif player1_store.length > player2_store.length
      @player1
    else
      @player2
    end
  end
  
end
