module PlayerLogic
  class Base
    attr_reader :aciton_count, :unit

    def initialize(unit)
      @unit = unit
      @action_count = 5
    end

    def walk dir
      @unit.move(dir)
      @action_count -= 1
      return {walk: dir}
    end

    def play
      walk :down
    end
  end
end
