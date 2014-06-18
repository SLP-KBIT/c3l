class Unit
  attr_reader :pos

  def initialize(point)
    @pos = point
  end

  def walk dir
    @pos = @pos + Point.create_from_dir(dir)
  end

  def action(method, arg)
    self.__send__(method, arg)
  end

  def to_s
    "P"
  end
end
