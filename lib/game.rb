require './lib/chess_pieces/pieces'
require './lib/board'
require './lib/position'

class Game
  include Position
  attr_accessor :pieces, :board

  def initialize
    @board = Board.new
    @pieces = Pieces.new
  end

  def start_game
    board.show_board
    pieces.assemble(@board.board)
    board.show_board
  end

  def choose_a_piece
    choice = position?(board.columns)
    # until pieces.chess_piece?(choice)
    #   choice = position?(board.columns)
    # end
    chess_piece?(choice, board)
  end

  def chess_piece?(choice,board)
    return pieces.piece?(board.board[choice[0]][choice[1]]) if pieces.pieces.include?(board.board[choice[0]][choice[1]])

    "\nEmpty Space" if board.board[choice[0]][choice[1]] == '.'
  end
end

g = Game.new
g.start_game
print g.choose_a_piece