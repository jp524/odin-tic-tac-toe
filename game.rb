class Board
  attr_reader :positions

  def initialize
    @positions = [['a1', 'b1', 'c1'], ['a2', 'b2', 'c2'], ['a3', 'b3', 'c3']]
  end

  def display_grid
    @positions.map do |row|
      row.join(' | ')
    end.join("\n------------\n")
  end
end

class Player
  attr_reader :board

  def initialize(marker, choices, board)
    @marker = marker
    @choices = choices
    @board = board
  end
end

board = Board.new
player1 = Player.new('X', ['a1', 'b2', 'c3'], board)
puts board.display_grid
