require_relative "./card.rb"
require_relative "./board.rb"
require_relative "./game.rb"
require_relative "./humanplayer.rb"
require "byebug"
me = Game.new(Board.new, HumanPlayer.new)
me.play
