class Turn
  def initialize(map: map, unit: unit)
    @map = map
    @unit = unit
  end

  def run
    puts show_map
    dir = read_action
     @unit.move dir
  end

  private

  def show_map
    visualizer = Visualizer.new(map: @map, unit: @unit)
    visualizer.visualize
  end

  def read_action
    loop do
      print input_description
      input = get_dir(gets.chomp)
      next unless input
      return input
    end
  end

  def get_dir str
    return input_dir_hash[str]
  end

  def input_description
    "\n" + "[U]:up  [D]:down [R]:right [L]:left" + "\n" + "> "
  end

  def input_dir_hash
     {
      # u,d,r,k from name
       "u" => :up,
       "d" => :down,
       "r" => :right,
       "l" => :left,
      # hjkl from vim
       "k" => :up,
       "j" => :down,
       "l" => :right,
       "h" => :left
    }
  end
end
