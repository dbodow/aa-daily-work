require 'colorize'
require 'colorized_string'
class Tile

  attr_reader :value, :given

  def initialize(value, given)
    @value = value
    @given = given
  end

  def to_s
    if @given
      @value.to_s.colorize(:red)
    else
      @value.to_s
    end
  end

  def value=(new_val)
    @value = new_val unless @given
  end

end
