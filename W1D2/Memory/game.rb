class Game

  attr_reader :board, :player

  def initialize(board, player)
    @board = board
    @board = optional_setup(board) if board.grid == []
    @player = player
    # add a player later
  end

  def optional_setup(board)
    puts "How many pairs of cards?"
    @board = board.populate(gets.chomp.to_i)
    @board
  end

  def play
    until @board.won?
      @board.render
      guessed_pos = @player.prompt
      make_guess(guessed_pos)
    end
    puts "You won!"
  end

  def make_guess(first_pos)
    player.get_input(first_pos, @board)
  end

end
