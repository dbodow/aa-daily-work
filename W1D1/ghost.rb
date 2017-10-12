$path='./dictionary.txt'
class Game

  attr_accessor :players, :fragment
  attr_reader :dictionary

  def current_player
    @players[:current_player]
  end

  def previous_player
    @players[:previous_player]
  end

  def next_player!
    @players[:current_player],@players[:previous_player]= @players[:previous_player],@players[:current_player]
  end

  def initialize(current, second)
    @players = Hash.new(:current_player => current, :previous_player => second )
    @dictionary = Set.new
    File.open($path).each_line{|line| }
  end

  def take_turn(player)

  end

  def valid_play?(string)

  end

  def play_round

  end

end

class Player


end
