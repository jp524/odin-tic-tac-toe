# frozen_string_literal: false

# Creates the tic-tac-toe board and displays positions
# available and positions chosen by players
class Board
  attr_reader :positions

  def initialize
    @positions = %w[a1 b1 c1 a2 b2 c2 a3 b3 c3]
  end

  def display_grid
    @positions.each_slice(3).map do |row|
      row.join(' | ')
    end.join("\n------------\n")
  end
end

# Handles information about the two players of the game
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

  def valid_input?(input)
    @board.positions.include?(input) ? true : false
  end

  def new_move(position)
    @choices.push(position)
    positions_on_board
  end
end

# Starts game and allows players to choose their position on the board
class RunGame
  @board = Board.new
  @player1 = Player.new('Player 1', 'X ', @board)
  @player2 = Player.new('Player 2', 'O ', @board)
  @victory_combinations = [%w[a1 b1 c1],
                           %w[a2 b2 c2],
                           %w[a3 b3 c3],
                           %w[a1 a2 a3],
                           %w[b1 b2 b3],
                           %w[c1 c2 c3],
                           %w[a1 b2 c3],
                           %w[a3 b2 c1]]
  @game_over = false
  @active_player = @player1
  @players_list = [@player1, @player2]
  @valid_input = false
  @input = ''

  def self.input_prompt
    @input = ''
    loop do
      puts "#{@active_player.name}: Enter the name of a cell on the board. E.g. 'a1' or 'c2'."
      @input = gets.chomp
      @valid_input = @active_player.valid_input?(@input)
      break if @valid_input == true

      puts "Invalid input. Please try again.\n\n" if @valid_input == false
    end
  end

  def self.play_turn
    @active_player.new_move(@input)
    puts "#{@board.display_grid}\n"
  end

  def self.victory?
    @game_over = true if @victory_combinations.include?(@active_player.choices)
    puts "#{@active_player.name} wins!" if @game_over == true
  end

  def self.switch_player
    @active_player = @players_list.reject { |player| player == @active_player }.pop
  end

  puts "\nWelcome to Tic-Tac-Toe!\n\n#{@board.display_grid}\n "

  while @game_over == false
    input_prompt
    play_turn
    victory?
    switch_player
  end
end

RunGame.new
