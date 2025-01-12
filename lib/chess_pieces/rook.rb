class Rook
  attr_accessor :rook_white, :rook_black

  def initialize
    @rook_white = "\u2656"
    @rook_black = "\u265C"
    @name = 'Rook'
  end

  def rook?(piece)
    if piece == rook_black || piece == rook_white
      @name
    else
      false
    end
  end
end
