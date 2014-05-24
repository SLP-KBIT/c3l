class Cell
  def initialize(color: :clear, goal: false, start: false)
    @color = color
    @goal = goal
    @start = start
  end

  attr_accessor :color, :goal, :start

  def start?
    @start == true
  end

  def goal?
    @goal == true
  end
end
