class Unit
  attr_reader :pos

  def initialize
    @pos = Point.new(0,0)
  end

  def to_s
    "P"
  end
end
