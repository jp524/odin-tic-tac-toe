class Board
  attr_reader :positions

  def initialize
    @positions = %w[a1 b1 c1 a2 b2 c2 a3 b2 c3]
  end

  def display_grid
    @positions.each_slice(3).map do |row|
      row.join(' | ')
    end.join("\n------------\n")
  end
end

class Player
  attr_reader :board, :name, :choices

  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @choices = []
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
      p 'This cell is already taken or does not exist. Please choose another one.'
    end
  end
end

def run_game
  board = Board.new
  player1 = Player.new('Player 1', 'X', board)
  player2 = Player.new('Player 2', 'O', board)

  victory_combinations = [%w[a1 b1 c1],
                          %w[a2 b2 c2],
                          %w[a3 b3 c3],
                          %w[a1 a2 a3],
                          %w[b1 b2 b3],
                          %w[c1 c2 c3],
                          %w[a1 b2 c3],
                          %w[a3 b2 c1]]
  game_over = false
  player_turn = player1

  puts "\nWelcome to Tic-Tac-Toe!\n\n"
  puts board.display_grid
  puts "\n"

  while game_over == false
    puts "#{player_turn.name}: Enter the name of a cell on the board. E.g. 'a1' or 'c2'."
    player_turn.new_move(gets.chomp)
    puts board.display_grid
    puts "\n"

    if victory_combinations.include?(player_turn.choices)
      game_over = true
      puts "#{player_turn.name} wins!"
    end
  end
end

run_game
