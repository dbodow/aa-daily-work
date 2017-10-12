class Game

  attr_reader :board

  def initialize(board, name = "Juliet")
    @board = board
    @name = name
  end

  def play
    until board.solved?
      board.render
      input = prompt
      pos, val = input
      board.update(pos, val)
    end
    puts "You won! Good job, #{@name}!"
  end

  def prompt
    puts "Where do you want to change?"
    pos = gets.chomp.split(",").map(&:to_i)
    puts "What number should be put there?"
    val = gets.chomp.to_i
    [pos, val]
  end

end
