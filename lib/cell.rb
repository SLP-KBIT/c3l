module Cell
  class Base
    COLOR_CLEAR = :clear
    COLOR_RED   = :red
    COLOR_BLUE  = :blue
    COLORS = [ COLOR_CLEAR, COLOR_RED, COLOR_BLUE ]

    attr_reader :color, :type

    def initialize
      @color = COLORS.sample
    end

    def type
      self.class.to_s.split("::").last.downcase.to_sym
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
