class Pawn
  attr_accessor :pawn_white, :pawn_black

  def initialize
    @pawn_white = "\u2659"
    @pawn_black = "\u265F"
    @name = 'Pawn'
  end

  def pawn?(piece)
    if piece == pawn_black || piece == pawn_white
      @name
    else
      false
    end
  end
end


