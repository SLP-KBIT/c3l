require File.expand_path('../cell', __FILE__)

class Map < Array
  def initialize(size=3)
    self.concat create_cells(size)
    set_start
    set_goal
  end

  def cell(x: nil, y: nil)
    return nil if x < 0 || y < 0
    self[y][x] if self[y]
  end

  def start_point
    self.map.with_index{ |line, y|
      line.map.with_index { |cell, x|
       return Point.new(x, y) if cell.start?
      }
    }.compact
  end

  def goal_point
    self.map.with_index{ |line, y|
      line.map.with_index { |cell, x|
       return Point.new(x, y) if cell.goal?
      }
    }.compact
  end

  def try_move base_pos, dir
    pos = base_pos + Point.create_from_dir(dir)
    return nil unless self.cell(x: pos.x, y: pos.y)
    return pos
  end

  private

  def create_2d_array(size)
    Array.new(size) { Array.new(size) }
  end

  def create_cells(size)
    cells = create_2d_array(size)
    cells.map!.with_index { |line, y| line.map!.with_index { |cell, x| cell = Cell::Normal.new } }
  end

  def set_start
    top_line = self.first
    index = (0...top_line.size).to_a.sample
    top_line[index] = Cell::Start.new
  end

  def set_goal
    bottom_line = self.last
    index = (0...bottom_line.size).to_a.sample
    y = self.map(&:first).size
    bottom_line[index] = Cell::Goal.new
  end
end
