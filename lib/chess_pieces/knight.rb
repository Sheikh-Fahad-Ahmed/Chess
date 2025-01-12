class Knight
  attr_accessor :knight_white, :knight_black

  def initialize
    @knight_white = "\u2658"
    @knight_black = "\u265E"
    @name = 'Knight'
  end

  def knight?(piece)
    if piece == knight_black || piece == knight_white
      @name
    else
      false
    end
  end
end
