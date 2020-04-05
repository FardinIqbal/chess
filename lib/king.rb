class King
  require_relative '../../chess/lib/board'
  require_relative '../../chess/lib/movable'
  include Movable

  attr_accessor :pos, :board, :icon, :color
  def initialize(color, board)
    @color = color
    @board = board
    @icon = unicode
    @pos = nil
  end

  def unicode
    @color == 'white' ? "\u2654" : "\u265A"
  end

  def move_list
    # returns all positions the rook can move to
    list = []
    list << left[0] unless left[0].nil?
    list << top_left[0] unless left[0].nil?
    list << forward[0] unless left[0].nil?
    list << top_right[0] unless left[0].nil?
    list << right[0] unless left[0].nil?
    list << bot_right[0] unless left[0].nil?
    list << backward[0] unless left[0].nil?
    list << bot_left[0] unless left[0].nil?
    list
  end
end