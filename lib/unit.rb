class Unit
  attr_reader :pos

  def initialize(point)
    @pos = point
  end

  def move dir
    @pos = @pos + Point.create_from_dir(dir)
  end

  def to_s
    "P"
  end
end
