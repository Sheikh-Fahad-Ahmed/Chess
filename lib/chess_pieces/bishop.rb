class Bishop
  attr_accessor :bishop_white, :bishop_black

  def initialize
    @bishop_white = "\u2657"
    @bishop_black = "\u265D"
    @name = 'Bishop'
  end

  def attribute?(piece)
    return self if piece == bishop_black || bishop_white

    false
  end
end
