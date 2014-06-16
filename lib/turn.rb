class Turn
  def initialize(map: map, unit: unit)
    @map = map
    @unit = unit
  end

  def run
    puts show_map
    unit_action
  end

  private

  def show_map
    visualizer = Visualizer::CUI.new(map: @map, unit: @unit)
    visualizer.visualize
  end

  def unit_action
    dir = read_action
    @unit.move dir
    p unit_pos: @unit.pos
  end

  def read_action
    loop do
      print input_description
      input_dir = get_dir(gets.chomp)


      next if input_dir.nil?
      tmp = @map.try_move(@unit.pos, input_dir)
      p try_move: tmp
      next if tmp.nil?

      return input_dir
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
