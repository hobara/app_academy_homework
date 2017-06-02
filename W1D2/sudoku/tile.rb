class Tile
  attr_reader :value

  def initialize(value = 0)
    @value = value.to_i
  end

  def to_s
    @value.to_s
  end

end
