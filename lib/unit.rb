class Unit
  attr_reader :pos, :action

  def initialize(point)
    @pos = point
    @action = nil
  end

  def walk dir
    @pos = @pos + Point.create_from_dir(dir)
  end

  def add_action(method, arg)
    # self.__send__(method, arg)
    @action = { method: method, arg: arg}
  end

  def act
    self.__send__(@action[:method], @action[:arg])
  end

  def to_s
    "P"
  end
end
