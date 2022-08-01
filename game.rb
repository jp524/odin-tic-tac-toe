class Game
  attr_reader :player, :choices

  def initialize(player, choices)
    @player = player
    @choices = choices
  end

  def display(position)
    @choices.include?(position) ? 'X' : ' '
  end

  def display_grid
    print "#{display('a1')} | #{display('a2')} | #{display('a3')}\n"
    print "---------\n"
    print "#{display('b1')} | #{display('b2')} | #{display('b3')}\n"
    print "---------\n"
    print "#{display('c1')} | #{display('c2')} | #{display('c3')}\n"
  end
end

player1 = Game.new('Player 1', ['a1', 'b2', 'c3'])
player1.display_grid
