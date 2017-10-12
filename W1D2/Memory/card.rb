class Card
  attr_reader :peekaboo, :value

  def initialize(value)
    @peekaboo = false
    @value = value
  end

  def hide
    @peekaboo = false
  end

  def reveal
    @peekaboo = true
  end

  def to_s
    if @peekaboo
      @value.to_s
    else
      "*"
    end
  end

  def ==(second_card)
    # To do
    # Figure out what to do if one of the cards is face down
    @value == second_card.value
  end
end
