class King
  attr_accessor :king_white, :king_black

  def initialize
    @king_white = "\u2654"
    @king_black = "\u265A"
    @name = 'King'
  end

  def king?(piece)
    if piece == king_black || piece == king_white
      @name
    else
      false
    end
  end
end
