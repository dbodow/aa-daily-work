require_relative "Board.rb"
require_relative "Tile.rb"
require_relative "Game.rb"
require "byebug"

solved = Board.from_file("sudoku1-solved.txt")
unsolved = Board.from_file("sudoku1.txt")
almost = Board.from_file("sudoku1-almost.txt")


puts solved.solved?
puts unsolved.solved?
Game.new(almost).play
