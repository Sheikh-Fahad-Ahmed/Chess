require './lib/setup'
require './lib/board'

class Game
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
end


g = Game.new
g.start_game