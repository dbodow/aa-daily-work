require "byebug"
class Board

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.read_file(path)
    # debugger
    tiles = []
    File.readlines(path).each do |line|
      holder = []
      line.chomp.chars.each do |ch|
        if ch == "0"
          holder << Tile.new('0'.to_i, false)
        else
          holder << Tile.new(ch.to_i, true)
        end
      end
      tiles << holder
    end
    tiles
  end

  def self.from_file(path)
    Board.new(Board.read_file(path))
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
      holder = []
      row.each do |tile|
        holder << tile.to_s
      end
      rendered << holder.join(' ')
    end
    puts rendered.join("\n")
  end

  def update(pos, value)
    self[pos].value = value
  end

  def solved?

    # check every col
    (0..8).each do |col|
      to_check = []
      (0..8).each do |row|
        to_check << self[[row, col]].value
      end
      return false unless finshed?(to_check)
    end

    # check every row
    (0..8).each do |row|
      to_check = []
      (0..8).each do |col|
        to_check << self[[row, col]].value
      end
      return false unless finshed?(to_check)
    end

    # check every 3x3
    indices = []
    (0..8).each_slice(3) { |i| indices << i }
    indices = indices.product(indices)
    indices.each do |pos|
      to_check = square_to_arr(pos)
      return false unless finshed?(to_check)
    end

    true
  end

  def square_to_arr(indices_pairs)
    output = []
    rows, cols = indices_pairs
    rows.each do |row|
      cols.each do |col|
        output << self[[row, col]].value
      end
    end
    output
  end

  def finshed?(arr)
    arr.sort == (1..9).to_a
  end

end
