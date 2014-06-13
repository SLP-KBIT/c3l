class Unit
  attr_reader :pos

  def initialize(point)
    @pos = point
  end

  def to_s
    "P"
  end
end
