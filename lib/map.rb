require File.expand_path('../cell', __FILE__)

class Map
  attr_accessor :cells

  def initialize(size: 3, start_x: 0 , start_y: size-1, goal_x: size-1, goal_y: 0)
    @size = size
    @cells = create_cells
    set_start
    set_goal
  end

  private

  def create_cells
    cells = Array.new(@size) { Array.new(@size) }
    cells.map! { |line| line.map! { |cell| cell = Cell::Normal.new } }
  end

  def set_start
    top_line = @cells.first
    index = (0...top_line.size).to_a.sample
    top_line[index] = Cell::Start.new
  end

  def set_goal
    bottom_line = @cells.last
    index = (0...bottom_line.size).to_a.sample
    bottom_line[index] = Cell::Goal.new
  end
end
