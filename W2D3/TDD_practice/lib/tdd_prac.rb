class Array

  def my_uniq
    new_array = []
    seen = {}

    self.each do |element|
      next if seen[element]
      new_array << element
      seen[element] = true
    end
    new_array
  end

  def two_sum
    combinations = (0..self.length-1).to_a.combination(2).to_a
    combinations.select do |pair|
      self[pair[0]] + self[pair[1]] == 0
    end
  end

  def my_transpose
    columns = Array.new(self.size) { Array.new {[]} }
    self.each do |row|
      row.each_with_index do |col,c_idx|
        columns[c_idx] << col
      end
    end
    columns
  end

  def stock_picker
    (0..self.length-1).to_a.combination(2).to_a.max_by {|x,y| self[y] - self[x]}
  end
end

class TowersOfHanoi
  attr_accessor :towers
  def initialize
    @towers = [[1,2,3],[],[]]
  end

  def won?
    self.towers == [[],[1,2,3],[]] || self.towers == [[],[],[1,2,3]]
  end

end
