class Turn
  attr_reader :map, :unit, :player_logic
  def initialize(round)
    @map = round.map
    @player_logic = round.player_logic
    @unit = @player_logic.unit
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
    action = UI.read_action(self, true)
    @unit.action(action.keys.first, action.values.first)
  end

  # ロジックファイルによる自動操作
  def load_action
    @round.player_logic.play
  end
end
