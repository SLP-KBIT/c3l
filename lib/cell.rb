class Cell
  COLOR_CLEAR = :clear
  COLOR_RED   = :red
  COLOR_BLUE  = :blue
  COLORS = [ COLOR_CLEAR, COLOR_RED, COLOR_BLUE ]

  attr_reader   :color
  attr_accessor :goal, :start

  def initialize(color: nil, goal: false, start: false)
    @color = color || COLORS.sample
    @goal = goal
    @start = start
  end

  def start?
    @start == true
  end

  def goal?
    @goal == true
  end
end
