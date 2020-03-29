class Rook
  require_relative '../../chess/lib/board'

  attr_accessor :pos, :board, :icon
  def initialize(color, board)
    @color = color
    @board = board
    @icon = unicode
    @pos = nil
  end

  def unicode
    @color == 'white' ? "\u2656" : "\u265C"
  end  

  def move(pos)
    # moves the rook on the board
    if move_list.include?(pos)
      @board.board[pos[0]][pos[1]], @board.board[@pos[0]][@pos[1]] = @board.board[@pos[0]][@pos[1]], @board.board[pos[0]][pos[1]]
    end
  end

  def move_list
    # returns all positions the rook can move to
    horizontal + vertical
  end

  def horizontal
    # returns all positions horizontal of the rook
    left + right
  end

  def left
    # returns all positions left of the rook
    coordinates = []
    @board.board.each_with_index do |row, index|
      next if index >= @pos[0]

      break unless @board.board[index][@pos[1]] == ' '

      coordinates << [index, @pos[1]]
    end
    coordinates
  end

  def right
    # returns all the positions right of the rook
    coordinates = []
    @board.board.each_with_index do |row, index|
      next if index <= @pos[0]

      break unless @board.board[index][@pos[1]] == ' '

      coordinates << [index, @pos[1]]
    end
    coordinates
  end

  def vertical
    # returns all vertical positions the rook can move to
    backward + forward
  end

  def forward
    # returns all positions forwards
    coordinates = []
    @board.board[@pos[0]].each_with_index do |cell, index|
      next if index <= @pos[1]

      break unless cell == ' '

      coordinates << [@pos[0], index] if cell == ' '
    end
    coordinates
  end

  def backward
    # returns all positions backwards
    coordinates = []
    @board.board[@pos[0]].each_with_index do |cell, index|
      next if index >= @pos[1]

      break unless cell == ' '

      coordinates << [@pos[0], index]
    end
    coordinates
  end

  def in_range?(coord)
    coord[0] <= 8 && coord[0] >= 0 && coord[1] <= 8 && coord[1] >= 0
  end
end