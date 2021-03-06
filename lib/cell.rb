module Cell
  class Base
    COLOR_CLEAR = :clear
    COLOR_RED   = :red
    COLOR_BLUE  = :blue
    COLORS = [ COLOR_CLEAR, COLOR_RED, COLOR_BLUE ]

    attr_reader :color, :point

    def initialize(x: 0, y: 0)
      @color = COLORS.sample
      @point = Point.new(x, y)
    end

    def type
      self.class.to_s.split("::").last.downcase.to_sym
    end

    def start?
      self.type == :start
    end

    def goal?
      self.type == :goal
    end
  end

  class Normal < Base
    def to_s
      " "
    end
  end

  class Start < Base
    def to_s
      "S"
    end
  end

  class Goal < Base
    def to_s
      "G"
    end
  end
end
