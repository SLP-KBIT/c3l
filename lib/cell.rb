class Cell
  def initialize(color: :clear, goal: false, start: false)
    @color = color
    @goal = goal
    @start = start
  end

  def color
    return @color
  end

  def start?
    return true if @start
    return false
  end

  def goal?
    return true if @goal
    return false
  end
end
