require "set"
require "byebug"

$PATH = './dictionary.txt'
class Game

  attr_accessor :players, :fragment
  attr_reader :dictionary

  def current_player
    @players[:current]
  end

  def previous_player
    @players[:previous]
  end

  def next_player!
    @players[:current],@players[:previous]= @players[:previous],@players[:current]
  end

  def initialize(current, second)
    @players = Hash.new(:current => current, :previous => second )
    @dictionary = Set.new
    debugger
    File.open($PATH).readlines do |line|
      @dictionary << line.chomp
    end
  end

  def take_turn(player)

  end

  def valid_play?(string)

  end

  def play_round

  end
end
