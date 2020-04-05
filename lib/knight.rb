class Knight
  require_relative '../../chess/lib/board'
  require_relative '../../chess/lib/movable'
  include Movable
  attr_accessor :pos, :icon, :board, :color

  @@directions = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

  def initialize(color, board)
    @board = board
    @color = color
    @icon = unicode
    @pos = nil
  end

  def move_list
    new_positions = []
    @@directions.each do |direction|
      new_position = add_array(direction, @pos)
      new_positions << new_position if valid_coord?(new_position)
    end
    new_positions
  end

  def unicode
    @color == 'white' ? "\u2658" : "\u265E"
  end
end