require File.expand_path('../cell', __FILE__)

class Map < Array
  def initialize(size=3)
    self.concat create_cells(size)
    set_start
    set_goal
  end

  def cell(x: nil, y: nil)
    pos = Point.new(x, y)
    result = self.map { |line|
      line.map { |cell|
        cell if cell.point == pos
      }.compact
    }.flatten.first

    return result
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

  # base_pointの座標を起点にその周囲sizeマスだけのMapを切り出して、UnitMapを生成する
  def create_unit_map(base_point, size)
    new_map = create_cells(1 + 2*size)

    unit_map_base = self.select.with_index { |line, y|
      y.between?(base_point.y - size, base_point.y + size)
    }.map { |line|
      line.select.with_index { |cell, x|
        x.between?(base_point.x - size, base_point.x + size)
      }
    }
    return UnitMap.new(unit_map_base)
    return UnitMap.new(result)
  end

  private

  def create_2d_array(size)
    Array.new(size) { Array.new(size) }
  end

  def create_cells(size)
    cells = create_2d_array(size)
    cells.map!.with_index { |line, y| line.map!.with_index { |cell, x| cell = Cell::Normal.new(x: x, y: y) } }
  end

  def set_start
    top_line = self.first
    index = (0...top_line.size).to_a.sample
    top_line[index] = Cell::Start.new(x: index, y: 0)
  end

  def set_goal
    bottom_line = self.last
    y = self.map(&:first).size - 1
    index = (0...bottom_line.size).to_a.sample
    bottom_line[index] = Cell::Goal.new(x: index, y: y)
  end
end


class UnitMap < Map
  def initialize(map)
    self.concat map.dup
  end
end
