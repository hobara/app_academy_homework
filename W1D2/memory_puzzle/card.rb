class Card
  attr_reader :face_value

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def to_s
    return "[ ]" unless @face_up
    "[#{@face_value}]"
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
    @face_value
  end

  def ==(card)
    @face_value == card.face_value
  end

  def face_up?
    @face_up
  end

end
