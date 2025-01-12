class Bishop
  attr_accessor :bishop_white, :bishop_black

  def initialize
    @bishop_white = "\u2657"
    @bishop_black = "\u265D"
    @name = 'Bishop'
  end

  def bishop?(piece)
    if piece == bishop_black || piece == bishop_white
      @name
    else
      false
    end
  end
end
