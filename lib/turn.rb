class Turn
  attr_reader :map, :unit
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
    dir = UI.read_action(false, self)
    @unit.move dir
  end

  # ロジックファイルによる自動操作
  def load_action
    @round.player_logic.play
  end
end
