require File.expand_path('../cell', __FILE__)

class Map
  attr_accessor :cells

  def initialize(size: 3, start_x: 0 , start_y: size-1, goal_x: size-1, goal_y: 0)
    @size = size
    @cells = create_cells
    set_start_cell(start_x, start_y)
    set_goal_cell(goal_x, goal_y)
  end

  private

  def create_cells
    cells = Array.new(@size) { Array.new(@size) }
    cells.map! { |line| line.map! { |cell| cell = Cell.new } }
  end

  def set_start_cell(x, y)
    @cells[y][x].start = true
  end

  def set_goal_cell(x, y)
    @cells[y][x].goal = true
  end
end
