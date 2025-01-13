require './lib/chess_pieces/pawn'
require './lib/chess_pieces/knight'
require './lib/chess_pieces/rook'
require './lib/chess_pieces/bishop'
require './lib/chess_pieces/king'
require './lib/chess_pieces/queen'

class Pieces
  attr_accessor :pawn, :knight, :rook, :bishop, :king, :queen, :columns, :pieces

  def initialize
    @rook = Rook.new
    @pawn = Pawn.new
    @knight = Knight.new
    @bishop = Bishop.new
    @king = King.new
    @queen = Queen.new
    @pieces = [rook.rook_white, rook.rook_black, pawn.pawn_white, pawn.pawn_black, knight.knight_white, 
               knight.knight_black, bishop.bishop_white, bishop.bishop_black, king.king_white, king.king_black, 
               queen.queen_white, queen.queen_black]
  end

  def pawn_setup(board)
    board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        board[row_index][col_index] = pawn.pawn_white if row_index == 6
        board[row_index][col_index] = pawn.pawn_black if row_index == 1
      end
    end
  end

  def knight_setup(board)
    board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && [1, 6].include?(col_index)
          board[row_index][col_index] = knight.knight_black
        elsif row_index == 7 && [1, 6].include?(col_index)
          board[row_index][col_index] = knight.knight_white
        end
      end
    end
  end

  def rook_setup(board)
    board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && [0, 7].include?(col_index)
          board[row_index][col_index] = rook.rook_black
        elsif row_index == 7 && [0, 7].include?(col_index)
          board[row_index][col_index] = rook.rook_white
        end
      end
    end
  end

  def bishop_setup(board)
    board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && [2, 5].include?(col_index)
          board[row_index][col_index] = bishop.bishop_black
        elsif row_index == 7 && [2, 5].include?(col_index)
          board[row_index][col_index] = bishop.bishop_white
        end
      end
    end
  end

  def king_setup(board)
    board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && col_index == 4
          board[row_index][col_index] = king.king_black
        elsif row_index == 7 && col_index == 4
          board[row_index][col_index] = king.king_white
        end
      end
    end
  end

  def queen_setup(board)
    board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && col_index == 3
          board[row_index][col_index] = queen.queen_black
        elsif row_index == 7 && col_index == 3
          board[row_index][col_index] = queen.queen_white
        end
      end
    end
  end

  def assemble(board)
    pawn_setup(board)
    rook_setup(board)
    knight_setup(board)
    bishop_setup(board)
    king_setup(board)
    queen_setup(board)
  end

  def chess_piece?(choice,board)
    board[choice[0], choice[0]]
  end

  def piece?(piece)
    name = pawn.pawn?(piece) || rook.rook?(piece) || knight.knight?(piece) || bishop.bishop?(piece) || king.king?(piece) || queen.queen?(piece)
  end
end
