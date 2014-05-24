class Map
  def initialize(size: 3, start_x: 0 , start_y: size-1, goal_x: size-1, goal_y: 0)
    @size = size
    @cells = Array.new( @size ){ Array.new( @size ) }
    @cells.map!{ |line| line.map!{ |cell| cell = Cell.new } }
    @cells[start_y][start_x].start = true
    @cells[goal_y][goal_x].goal = true
  end

  attr_accessor :cells
end
