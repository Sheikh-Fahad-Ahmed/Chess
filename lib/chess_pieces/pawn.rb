class Pawn
  attr_accessor :pawn_white, :pawn_black, :name

  def initialize
    @pawn_white = "\u2659"
    @pawn_black = "\u265F"
    @name = 'Pawn'
  end

  def symbol
    [@pawn_white, @pawn_black]
  end

  def attribute?(piece)
    return self if symbol.include?(piece)

    false
  end

  def legal_moves(coordinate, board)
    moves = []
    if board[coordinate[0]][coordinate[1]] == pawn_white
      if coordinate[0] == 6
        moves.append(
          [(coordinate[0] - 1), coordinate[1]],
          [(coordinate[0] - 2), coordinate[1]]
        )
      else
        moves.append(
          [coordinate[0] - 1, coordinate[1]]
        )
      end
    elsif board[coordinate[0]][coordinate[1]] == pawn_black
      if coordinate[0] == 1
        moves.append(
          [8 - (coordinate[0] + 1), coordinate[1]],
          [8 - (coordinate[0] + 2), coordinate[1]]
        )
      else
        moves.append(
          [coordinate[0] + 1, coordinate[1]]
        )
      end
    end
    moves
  end
end