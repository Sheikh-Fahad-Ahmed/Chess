class King
  attr_accessor :king_white, :king_black, :name

  def initialize
    @king_white = "\u2654"
    @king_black = "\u265A"
    @name = 'King'
  end

  def symbol
    [@king_black, @king_white]
  end

  def attribute?(piece)
    return self if piece == king_black || king_white

    false
  end
end
