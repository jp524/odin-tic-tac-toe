class Board
  attr_reader :positions

  def initialize
    @positions = ['a1', 'b1', 'c1', 'a2', 'b2', 'c2', 'a3', 'b3', 'c3']
  end

  def display_grid
    @positions.each_slice(3).map do |row|
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

  def positions_on_board
    @board.positions.map! do |position|
      @choices.include?(position) ? @marker : position
    end
  end

  def new_move(position)
    if @board.positions.include?(position)
      @choices.push(position)
      positions_on_board
    else
      p 'This spot is already taken. Choose another one.'
    end
  end
end

board = Board.new
player1 = Player.new('X', ['a1', 'b2', 'c3'], board)
player2 = Player.new('O', ['a2', 'b3', 'c1'], board)
player1.positions_on_board
player2.positions_on_board
player1.new_move('b1')
puts board.display_grid
