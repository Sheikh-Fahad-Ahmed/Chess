class Bishop
  attr_accessor :bishop_white, :bishop_black, :name

  def initialize
    @bishop_white = "\u2657"
    @bishop_black = "\u265D"
    @name = 'Bishop'
  end

  def symbol
    [@bishop_black, @bishop_white]
  end

  def attribute?(piece)
    return self if piece == bishop_black || bishop_white

    false
  end
end
