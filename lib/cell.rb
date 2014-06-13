module Cell
  class Base
    COLOR_CLEAR = :clear
    COLOR_RED   = :red
    COLOR_BLUE  = :blue
    COLORS = [ COLOR_CLEAR, COLOR_RED, COLOR_BLUE ]

    attr_reader :color, :type

    def initialize(color=nil)
      @color = color || COLORS.sample
    end

    def type
      self.class.to_s.split("::").last.downcase.to_sym
    end
  end

  class Normal < Base
  end

  class Start < Base
  end

  class Goal < Base
  end
end
