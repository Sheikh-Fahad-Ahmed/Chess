module Position

  def position?(columns)
    puts "\nEnter the position"
    position_arr = gets.chomp.split('').reverse
    position_arr[0] = 8 - position_arr[0].to_i
    position_arr[1] = columns[position_arr[1]] - 1
    position_arr
  end
end
