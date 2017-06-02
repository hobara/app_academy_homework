require_relative 'card'

class Board
  attr_reader :difficulty

  def initialize(difficulty)
    difficulties = { 1 => [2, 3], 2 => [3, 4], 3 => [4, 5] }
    @difficulty = difficulties[difficulty]
    populate
  end

  def populate
    rows, cols = @difficulty
    num = rows * cols / 2
    values = (0...num).to_a + (0...num).to_a
    values.shuffle!
    @grid = Array.new(rows) { Array.new(cols) }
    @grid.each do |row|
      row.each_index do |idx|
        row[idx] = Card.new(values.pop)
      end
    end
  end

  def render
    system("clear")
    puts "\n\n"
    @grid.each_with_index do |row, r_idx|
      print_row = []
      row.each_with_index do |_, c_idx|
        print_row << "#{@grid[r_idx][c_idx]}"
      end
      puts print_row.join(" ")
    end
  end

  def won?
    @grid.flatten.all?(&:face_up?)
  end

  def reveal(pos)
    row, col = pos
    if @grid[row][col].nil?
      puts "Invalid"
      play
    else
      @grid[row][col].reveal
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

end
