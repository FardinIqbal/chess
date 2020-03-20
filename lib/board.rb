class Board
  attr_accessor :board
  @@labels = %w[A B C D E F G H]
  def initialize
    @board = Array.new(8) { Array.new(8, ' ') }
  end

  def render
    # puts the entire 2D board
    label
    separate_row
    8.times do |row|
      print_row(row)
      separate_row
    end
    label
  end

  def label
    print '   | '
    @@labels.each do |letter|
      print "#{letter} | "
    end
    puts ''
  end

  def separate_row
    # puts ------------- to separate each row of the board
    print '  '
    35.times do
      print '-'
    end
    puts ''
  end

  def print_row(row)
    # puts the specified row oof the 2D board
    print "  #{8 - row}"
    8.times do |column|
      # puts each of the columns in the specified row
      print "| "
      print @board[column][7 - row]
      print ' '
    end
    print "|#{8 - row}"
    puts ''
  end

  def pos(coord)
    @board[coord[0]][coord[1]]
  end
end
