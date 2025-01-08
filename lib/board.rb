require './lib/pieces/pawn'
require './lib/pieces/knight'
require './lib/pieces/rook'
require './lib/pieces/bishop'
require './lib/pieces/king'
require './lib/pieces/queen'

class Board
  attr_accessor :board, :pawn, :knight, :rook, :bishop, :king, :queen, :columns

  def initialize
    @rook = Rook.new
    @pawn = Pawn.new
    @knight = Knight.new
    @bishop = Bishop.new
    @king = King.new
    @queen = Queen.new
    @board = Array.new(8) { Array.new(8, '.') }
    @num_arr = (1..8).to_a.reverse
    @columns = ('a'..'h').each.with_index(1).to_h
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

  def rook_setup
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && [0, 7].include?(col_index)
          @board[row_index][col_index] = rook.rook_black
        elsif row_index == 7 && [0, 7].include?(col_index)
          @board[row_index][col_index] = rook.rook_white
        end
      end
    end
  end

  def bishop_setup
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && [2, 5].include?(col_index)
          @board[row_index][col_index] = bishop.bishop_black
        elsif row_index == 7 && [2, 5].include?(col_index)
          @board[row_index][col_index] = bishop.bishop_white
        end
      end
    end
  end

  def king_setup
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && col_index == 4
          @board[row_index][col_index] = king.king_black
        elsif row_index == 7 && col_index == 4
          @board[row_index][col_index] = king.king_white
        end
      end
    end
  end

  def queen_setup
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        if row_index.zero? && col_index == 3
          @board[row_index][col_index] = queen.queen_black
        elsif row_index == 7 && col_index == 3
          @board[row_index][col_index] = queen.queen_white
        end
      end
    end
  end

  def update_position(previous_position, new_position)
    new_position[0] = 8 - new_position[0].to_i
    new_position[1] = @columns[new_position[1]] - 1
    previous_position[0] = 8 - previous_position[0].to_i
    previous_position[1] = @columns[previous_position[1]] - 1
    print new_position
    print previous_position
    @board[new_position[0]][new_position[1]] = @board[previous_position[0]][previous_position[1]]
    @board[previous_position[0]][previous_position[1]] = '.'
  end

  def previous_position?
    puts "\nEnter a previous position"
    gets.chomp.split('').reverse
  end

  def new_position?
    puts "\nEnter a new position"
    gets.chomp.split('').reverse
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
b.rook_setup
b.bishop_setup
b.king_setup
b.queen_setup
b.show_board
print b.columns
puts 
b.board[1][1] = "\u265B"
b.show_board
puts
b.update_position(b.previous_position?, b.new_position?)
puts
b.show_board
