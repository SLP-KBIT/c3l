class UI
  INPUT_DESCRIPTION = "\n" + "[U]:up  [D]:down [R]:right [L]:left" + "\n" + "> ".freeze
  def self.puts arg
    puts arg
  end

  # 対話的な操作
  def self.read_action(auto_flag = true, turn = nil)
    loop do
      unless auto_flag
        print INPUT_DESCRIPTION
        input_dir = get_dir(gets.chomp)
        next if input_dir.nil? || turn.map.try_move(turn.unit.pos, input_dir).nil?
      end
      return { walk: input_dir}
    end
  end

  def self.get_dir str
    return input_dir_hash[str]
  end

  # def input_description
  #   "\n" + "[U]:up  [D]:down [R]:right [L]:left" + "\n" + "> "
  # end

  def self.input_dir_hash
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
