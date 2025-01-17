class Rook
  attr_accessor :rook_white, :rook_black, :name

  def initialize
    @rook_white = "\u2656"
    @rook_black = "\u265C"
    @name = 'Rook'
  end

  def symbol
    [@rook_black, @rook_white]
  end

  def attribute?(piece)
    return self if piece == rook_black || rook_white

    false
  end
end
