class Knight
  attr_accessor :knight_white, :knight_black, :name

  def initialize
    @knight_white = "\u2658"
    @knight_black = "\u265E"
    @name = 'Knight'
  end

  def symbol
    [@knight_black, @knight_white]
  end

  def attribute?(piece)
    return self if piece == knight_black || knight_white

    false
  end
end
