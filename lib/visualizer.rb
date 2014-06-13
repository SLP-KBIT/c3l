class Visualizer
  def initialize(map: nil, unit: nil)
    @map = map
    @unit = unit
  end

  def visualize
    @map.map.with_index { |line, index|
      line.map.with_index { |cell, index|
        str ||= Rainbow(' ').bg(cell.color) unless cell.color == :clear
      }.join
    }.join("\n")
  end
end
