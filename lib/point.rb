class Point < Struct.new(:x, :y)
  def + other
    x = self.x + other.x
    y = self.y + other.y
    return Point.new(x, y)
  end

  def self.create_from_dir dir
    return Point.new(0 , -1)  if dir == :up
    return Point.new(0 , 1)   if dir == :down
    return Point.new(-1, 0)   if dir == :left
    return Point.new(1 , 0)   if dir == :right
  end
end
