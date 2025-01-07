require './lib/pieces/pawn'

class Board
  attr_accessor :board, :pawn

  def initialize
    @pawn = Pawn.new
    @board = Array.new(8) { Array.new(8, '.') }
    # @board = Array.new(8) do |num|
    #   Array.new(8) do
    #     Pawn.new if [1, 6].include?(num)
    #   end
    # end
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
b.show_board
