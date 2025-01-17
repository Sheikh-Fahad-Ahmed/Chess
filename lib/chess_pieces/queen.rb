class Queen
  attr_accessor :queen_black, :queen_white

  def initialize
    @queen_black = "\u265B"
    @queen_white = "\u2655"
    @name = 'Queen'
  end

  def attribute?(piece)
    return self if piece == queen_black || queen_white

    false
  end
end
