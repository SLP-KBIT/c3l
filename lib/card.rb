class Card
  COLOR_RED = :red
  COLOR_BLUE = :blue
  COLORS = [ COLOR_RED, COLOR_BLUE ]

  attr_reader :number

  def initialize(color)
    raise 'given color is not allowed' unless COLORS.include? color
    @color = color
    @number = 1
  end

  def red?
    @color == COLOR_RED
  end

  def blue?
    @color == COLOR_BLUE
  end
end
