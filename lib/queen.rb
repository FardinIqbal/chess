class Queen
  require_relative '../../chess/lib/board'
  require_relative '../../chess/lib/movable'
  include Movable
  attr_accessor :pos, :icon, :board, :color

  def initialize(color, board)
    @board = board
    @color = color
    @icon = unicode
    @pos = nil
  end

  def move_list
    vertical + horizontal + diagonals
  end

  def unicode
    # sets the pieces image
    @color == 'white' ? "\u2655" : "\u265B"
  end
end
