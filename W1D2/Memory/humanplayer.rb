class HumanPlayer
  attr_reader :name

  def initialize(name = "Romeo")
    @name = name
  end

  def prompt
    puts "Which card do you want to flip?"
    gets.chomp.split(',').map(&:to_i)
  end

  def get_input(first_pos, board)
    puts "Your first guess was #{board[first_pos].value}
    located at #{first_pos}.
    Where will you guess to match?"
    second_pos = prompt
    board.reveal(first_pos)
    board.reveal(second_pos)
    board.render
    if board[first_pos] == board[second_pos]
      puts "It's a match!"
    else
      puts "Tough luck, #{@name}."
      board.hide(first_pos)
      board.hide(second_pos)
    end
  end

end
