require_relative "../skeleton/lib/00_tree_node.rb"
require "byebug"

class KnightPathFinder

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @visited_positions = [starting_pos]
    @board_poses = (0..7).to_a.product((0..7).to_a)
  end

  def find_path(destination_pos)

  end

  def valid_moves(current_pos)
    long_jumps(current_pos) + wide_jumps(current_pos)
  end

  def new_move_positions(pos)
    valid_moves(pos).reject { |move| @visited_positions.include?(move) }
  end

  def plus_minus(x, y)
    [x + y, x - y]
  end

  def long_jumps(current_pos)
    x, y = current_pos
    @board_poses.select do |h_shift, v_shift|
      plus_minus(x, 1).include?(h_shift) && plus_minus(y, 2).include?(v_shift)
    end
  end

  def wide_jumps(current_pos)
    x, y = current_pos
    @board_poses.select do |h_shift, v_shift|
      plus_minus(x, 2).include?(h_shift) && plus_minus(y, 1).include?(v_shift)
    end
  end

end
