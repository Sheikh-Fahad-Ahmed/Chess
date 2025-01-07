require './lib/pieces/pawn'
require './lib/pieces/knight'

class Board
  attr_accessor :board, :pawn, :knight

  def initialize
    @pawn = Pawn.new
    @knight = Knight.new
    @board = Array.new(8) { Array.new(8, '.') }
    @num_arr = (1..8).to_a
  end

  def pawn_setup
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        @board[row_index][col_index] = pawn.pawn_white if row_index == 6
        @board[row_index][col_index] = pawn.pawn_black if row_index == 1
      end
    end
  end

  def knight_setup
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && [1, 6].include?(col_index)
          @board[row_index][col_index] = knight.knight_black
        elsif row_index == 7 && [1, 6].include?(col_index)
          @board[row_index][col_index] = knight.knight_white
        end
      end
    end
  end

  def show_board
    print '  '
    ('a'..'h').each { |i| print "#{i} " }
    print "\n"
    i = 0
    @board.each do |row|
      print "#{@num_arr[i]} "
      puts row.join(' ')
      i += 1
    end
  end
end

b = Board.new
b.pawn_setup
b.knight_setup
b.show_board
