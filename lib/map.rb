require File.expand_path('../cell', __FILE__)

class Map
  attr_accessor :cells

  def initialize(size=3)
    @cells = create_cells(size)
    set_start
    set_goal
  end

  def size
    @size ||= @cells.first.size
  end

  private

  def create_2d_array(size)
    Array.new(size) { Array.new(size) }
  end

  def create_cells(size)
    cells = create_2d_array(size)
    cells.map!.with_index { |line, y| line.map!.with_index { |cell, x| cell = Cell::Normal.new(x, y) } }
  end

  def set_start
    top_line = @cells.first
    index = (0...top_line.size).to_a.sample
    top_line[index] = Cell::Start.new(index, 0)
  end

  def set_goal
    bottom_line = @cells.last
    index = (0...bottom_line.size).to_a.sample
    y = @cells.map(&:first).size
    bottom_line[index] = Cell::Goal.new(index, y)
  end
end
