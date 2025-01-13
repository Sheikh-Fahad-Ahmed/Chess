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
    choice = position?(board.columns) while chess_piece?(choice, board) == "\nEmpty Space"
    puts "You picked #{chess_piece?(choice, board)}"
    next_move(choice)
  end

  def next_move(choice)
    puts "\nEnter your next move: "
    new_position = position?(board.columns)
    until chess_piece?(new_position, board) == "\nEmpty Space"
      puts 'You picked a chess piece. Try again.'
      new_position = position?(board.columns)
    end
    board.update_position(choice, new_position)
  end

  def chess_piece?(choice,board)
    return pieces.piece?(board.board[choice[0]][choice[1]]) if pieces.pieces.include?(board.board[choice[0]][choice[1]])

    "\nEmpty Space" if board.board[choice[0]][choice[1]] == '.'
  end
end

g = Game.new
g.start_game
g.choose_a_piece
g.board.show_board