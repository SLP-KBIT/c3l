class Turn
  attr_reader :map, :unit, :player_logic
  def initialize(round)
    @map = round.map
    @player_logic = round.player_logic
    @unit = @player_logic.unit
  end

  def run
    map_range = 1
    @player_logic.add_unit_map(@map.create_unit_map(@unit.pos, map_range))
    puts show_map
    puts
    unit_action
  end

  private

  def show_map
    visualizer = Visualizer::CUI.new(map: @map, unit: @unit)
    visualizer.visualize
  end

  def unit_action
    # action = UI.read_action(self, false) # 手動操作
    action = UI.read_action(self, true) # 自動操作
    @unit.action(action.keys.first, action.values.first)
  end

  # ロジックファイルによる自動操作
  def load_action
    @round.player_logic.play
  end
end
