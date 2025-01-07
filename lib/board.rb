class Board
  def initialize
    @board = Array.new(8) { Array.new(8, '.') }
    @num_arr = (1..8).to_a
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
b.show_board
