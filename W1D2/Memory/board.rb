require "byebug"
class Board

  attr_reader :grid

  def initialize
    @grid = []
  end

  def populate(pairs)
    cards = []
    (1..pairs).each do |value|
      2.times { cards << Card.new(value) }
    end
    cards.shuffle!
    slice = (cards.length**0.5).ceil
    cards.each_slice(slice) { |a| @grid << a }
    self
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def render
    rendered = []
    @grid.each do |row|
      temp_arr = []
      row.each do |card|
        temp_arr << card.to_s
      end
      rendered << temp_arr.join(" ")
    end
    puts rendered.join("\n")
  end

  def won?
    @grid.flatten.each do |card|
      return false if !card.peekaboo
    end
    true
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    self[guessed_pos].value
  end

  def hide(guessed_pos)
    self[guessed_pos].hide
  end

end
