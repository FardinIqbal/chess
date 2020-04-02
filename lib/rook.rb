class Rook
  require_relative '../../chess/lib/board'
  require_relative '../../chess/lib/movable'
  include Movable

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

  def move_list
    # returns all positions the rook can move to
    horizontal + vertical
  end
end