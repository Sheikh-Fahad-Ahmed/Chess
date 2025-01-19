require './lib/chess_pieces/pieces'
require './lib/board'
require './lib/position'

class Game
  include Position
  attr_accessor :piece_instance, :board

  def initialize
    @board = Board.new
    @piece_instance = Pieces.new
  end

  def start_game
    board.show_board
    piece_instance.assemble(board.board)
    board.show_board
  end

  def choose_a_piece
    choice = position?(board.columns)
    choice = position?(board.columns) while chess_piece?(choice, board) == "\nEmpty Space"

    puts "You picked #{chess_piece?(choice, board).name}"
    next_move(choice)
  end

  def next_move(choice)
    moves = chess_piece?(choice, board).legal_moves(choice, board.board)
    print "Your legal moves are : #{moves}"
    puts "\nEnter your next move: "
    new_position = position?(board.columns)
    until chess_piece?(new_position, board) == "\nEmpty Space"
      puts 'You picked a chess piece. Try again.'
      new_position = position?(board.columns)
    end
    board.update_position(choice, new_position)
  end

  def chess_piece?(choice, board)
    piece_symbol = board.board[choice[0]][choice[1]]

    piece_instance.pieces.each do |piece|
      return piece if piece.symbol.include?(piece_symbol)
    end

    return "\nEmpty Space" if piece_symbol == '.'

    nil
  end
end

g = Game.new
g.start_game
g.choose_a_piece
g.board.show_board