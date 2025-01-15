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

  def legal_moves(coordinate, board)
    moves = []
    if board[coordinate[0]][coordinate[1]] == pawn_white && coordinate[0] == 6
      moves.append([coordinate[0] + 1], [coordinate[0] + 2])
    end
  end
end