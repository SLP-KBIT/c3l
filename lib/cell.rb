class Cell
  attr_reader   :color
  attr_accessor :goal, :start

  def initialize(color: :clear, goal: false, start: false)
    @color = color
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
