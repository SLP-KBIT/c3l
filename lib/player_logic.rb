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
      raise "out of range" unless movable? dir
      return {walk: dir}
    end

    # 指定方向1マス先のセルが移動可能かをどうかを取得する
    def movable? dir
      ! @unit_map.try_move(unit.pos, dir).nil?
    end


    # 行動AIの記述先
    # 1ターンごとのUnitの振る舞い
    def play
      walk :down
    end
  end
end
