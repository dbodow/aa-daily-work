class ComputerPlayer
  attr_reader :name

  def initialize(name = "Romeo")
    @name = name
    @memory = Hash.new
  end

  def prompt
    puts "Which card do you want to flip?"
    gets.chomp.split(',').map(&:to_i)
  end

  def get_input

  end

end
