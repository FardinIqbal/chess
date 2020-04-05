module Movable

  def move(pos)
    if move_list.include?(pos)
      @board.board[pos[0]][pos[1]] = @board.board[@pos[0]][@pos[1]]
      @board.board[@pos[0]][@pos[1]] = ' '
    else
      print 'That is not a valid move!'
    end
  end

  def diagonals
    bot_right + top_left + bot_left + top_right
  end

  def top_left
    # returns all possible moves bottom left of the bishop
    direction = [-1, 1]
    coordinates = []

    loop do
      next_pos = add_array(direction, @pos)
      break unless in_range?(next_pos)

      cell = @board.board[next_pos[0]][next_pos[1]]
      if cell == ' '
        coordinates << next_pos
      elsif cell.color != @color
        coordinates << next_pos
        break
      else
        break
      end
      direction = add_array(direction, [-1, 1])
    end
    coordinates
  end

  def top_right
    # returns all possible moves bottom left of the bishop
    direction = [1, 1]
    coordinates = []

    loop do
      next_pos = add_array(direction, @pos)
      break unless in_range?(next_pos)

      cell = @board.board[next_pos[0]][next_pos[1]]
      if cell == ' '
        coordinates << next_pos
      elsif cell.color != @color
        coordinates << next_pos
        break
      else
        break
      end
      direction = add_array(direction, [1, 1])
    end
    coordinates
  end

  def bot_right
    # returns all possible moves bottom left of the bishop
    direction = [1, -1]
    coordinates = []

    loop do
      next_pos = add_array(direction, @pos)
      break unless in_range?(next_pos)

      cell = @board.board[next_pos[0]][next_pos[1]]
      if cell == ' '
        coordinates << next_pos
      elsif cell.color != @color
        coordinates << next_pos
        break
      else
        break
      end
      direction = add_array(direction, [1, -1])
    end
    coordinates
  end

  def bot_left
    # returns all possible moves bottom left of the bishop
    direction = [-1, -1]
    coordinates = []

    loop do
      next_pos = add_array(direction, @pos)
      break unless valid_coord?(next_pos)

      cell = @board.board[next_pos[0]][next_pos[1]]
      if cell == ' '
        coordinates << next_pos
      elsif cell.color != @color
        coordinates << next_pos
        break
      else
        break
      end
      direction = add_array(direction, [-1, -1])
    end
    coordinates
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

      cell = @board.board[index][@pos[1]]
      if cell == ' '
        coordinates << [index, @pos[0]]
      elsif cell.color != @color
        coordinates << [index, @pos[0]]
        break
      else
        break
      end
    end
    coordinates
  end

  def right
    # returns all the positions right of the rook
    coordinates = []
    @board.board.each_with_index do |row, index|
      next if index <= @pos[0]

      cell = @board.board[index][@pos[1]]
      if cell == ' '
        coordinates << [index, @pos[0]]
      elsif cell.color != @color
        coordinates << [index, @pos[0]]
        break
      else
        break
      end
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

      if cell == ' '
        coordinates << [@pos[0], index]
      elsif cell.color != @color
        coordinates << [@pos[0], index]
        break
      else
        break
      end
    end
    coordinates
  end

  def backward
    # returns all positions backwards
    coordinates = []
    @board.board[@pos[0]].each_with_index do |cell, index|
      next if index >= @pos[1]

      if cell == ' '
        coordinates << [@pos[0], index]
      elsif cell.color != @color
        coordinates << [@pos[0], index]
        break
      else
        break
      end
    end
    coordinates
  end

  def add_array(arr1, arr2)
    [arr1[0] + arr2[0], arr1[1] + arr2[1]]
  end

  def valid_coord?(coord)
    if in_range?(coord)
      available?(coord)
    else
      false
    end
  end

  def available?(coord)
    @board.board[coord[0]][coord[1]] == ' '
  end

  def in_range?(coord)
    coord[0] <= 7 && coord[0] >= 0 && coord[1] <= 7 && coord[1] >= 0
  end
end
