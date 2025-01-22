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
    return self if symbol.include?(piece)

    false
  end

  def legal_moves(coordinate, board)
    puts coordinate
    moves = []
    if board[coordinate[0] - 1][coordinate[1]] == '.'
      (coordinate[0] - 1).downto(0).each do |i|
        break unless board[i][coordinate[1]] == '.'

        moves.append([i, coordinate[1]])
      end
    end
    moves
  end
end
