module Visualizer
  class CUI
    def initialize(map: nil, unit: nil)
      @map = map
      @unit = unit
    end

    def visualize
      @map.map.with_index { |line, y|
        line.map.with_index { |cell, x|
          chr = @unit.to_s if @unit && @unit.pos.x == x && @unit.pos.y == y
          chr ||= cell.to_s
          chr = Rainbow(chr).bg(cell.color) unless cell.color == :clear
          chr
        }.join
      }.join("\n")
    end
  end
end
