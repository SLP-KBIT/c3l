module PlayerLogic
  class Base
    attr_reader :aciton_count, :unit, :unit_map

    def initialize(unit)
      @unit = unit
      @action_count = 5
      @unit_map = nil
    end

    def add_unit_map(map)
      @unit_map = map
    end

    def walk dir
      @action_count -= 1
      result = @unit_map.try_move(unit.pos, dir)
      raise "out of range" if result.nil?
      return {walk: dir}
    end

    def play
      walk :down
    end
  end
end
