require './lib/setup'
require './lib/board'
require './lib/position'

class Game
  include Position
  attr_accessor :setup, :board

  def initialize
    @board = Board.new
    @setup = Setup.new
  end

  def start_game
    board.show_board
    setup.arrange_board(@board.board)
    board.show_board
  end

  def choose_a_piece
    choice = position?(@board.columns)
    # until chess_piece?(choice)
    #   choice = position?
    # end
  end

  def chess_piece?(choice)
    @board.board[choice[0]][choice[1]]
  end
end


g = Game.new
g.start_game
print g.choose_a_piece