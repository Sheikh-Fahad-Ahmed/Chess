class Queen
  attr_accessor :queen_black, :queen_white

  def initialize
    @queen_black = "\u265B"
    @queen_white = "\u2655"
    @name = 'Queen'
  end

  def queen?(piece)
    if piece == queen_black || piece == queen_white
      @name
    else
      false
    end
  end
end
