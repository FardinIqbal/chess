class Bishop
  require_relative '../../chess/lib/board'
  require_relative '../../chess/lib/movable'
  include Movable
  attr_accessor :pos, :icon, :board

  def initialize(color, board)
    @board = board
    @color = color
    @icon = unicode
    @pos = nil
  end

  def move_list
    # returns all possible moves
    bot_right + top_left + bot_left + top_right
  end

  def unicode
    # sets the pieces image
    @color == 'white' ? "\u2657" : "\u265D"
  end
end

