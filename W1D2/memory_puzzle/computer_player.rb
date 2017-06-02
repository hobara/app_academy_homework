class ComputerPlayer

  def initialize
    @known_values = Hash.new
    @unknown_values = Array.new
    @matched_card = []
  end

  def get_guess
    known_matches = find_matches
    puts "Known matches #{known_matches}"
    puts "Known values #{@known_values}"
    puts "Unknown guesses #{@unknown_values}"
    if known_matches.length > 0
      guess = known_matches.keys.pop
      puts "There is a match. Will guess #{guess}"
      guess
    elsif @unknown_values.length > 0
      guess = @unknown_values.shuffle.pop
      puts "Will guess #{guess}"
      guess
    else

    end
  end

  def find_matches
    @known_values.select { |k, v| @known_values.values.count(v) == 2 }
  end

  def recieve_revealed_card(pos, value)
    @known_values[pos] = value
    @unknown_values.delete(pos)
  end

  def recieve_match(pos1, pos2)
    puts "Deleting #{pos1} and #{pos2}"
    @known_values.delete(pos1)
    @known_values.delete(pos2)

    @matched_card << pos1 << pos2
  end

  def set_difficulty(dif)
    rows, cols = dif
    rows.times do |r|
      cols.times do |c|
        @unknown_values << [r, c]
      end
    end
    @unknown_values
  end

end
