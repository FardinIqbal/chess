class Pawn
  require_relative '../../chess/lib/board'
  attr_accessor :pos, :board
  @@directions = [[-1, 1], [0, 1], [0, 2], [1, 1]]
  def initialize(color, board)
    @color = color
    @pawn = unicode(@color)
    @pos = nil
    @moves = []
    @board = board
  end

  def unicode(color)
    # sets @pawn to be the image of a pawn of the respective color
    color == 'white' ? "\u2659" : "\u265F"
  end

  def move(pos)

  end

  def valid_positions
    positions = []
    positions << all_possible_positions[0] if top_left?
    positions << all_possible_positions[1] if straight1?
    positions << all_possible_positions[2] if straight2?
    positions << all_possible_positions[3] if top_right?
    positions_in_range(positions)
  end

  def positions_in_range(new_positions)
    # removes all moves that are out of the board and returns the new array
    new_positions.filter { |move| move.filter { |coord| coord <= 8 && coord >= 0 } }
  end

  def all_possible_positions
    # returns a list of all new positions including invalid positions
    @@directions.map { |direction| add_arrays(@pos, direction) }
  end

  def add_arrays(arr1, arr2)
    [arr1[0] + arr2[0], arr1[1] + arr2[1]]
  end

  def top_right?
    @pos[0] != 7 && @pos[1] != 7

  end

  def top_left?
    @pos[0] != 0 && @pos[1] != 7
  end

  def first_move?
    @pos[1] == 1
  end

  def straight1?
    @board.board[@pos[0]][@pos[1] + 1] == ' '
  end

  def straight2?
    @board.board[@pos[0]][@pos[1] + 2] == ' ' && first_move? && straight1?
  end

  def promote(new_piece)
    # turns a pawn into a different piece when it reaches the other side
  end
end

