class Round
  attr_reader :map, :player_logic
  def initialize
    @map = Map.new 5
    @unit = Unit.new(@map.start_point)
    @player_logic = PlayerLogic::Base.new(@unit)
  end

  def run
    loop do
      turn = Turn.new(self)
      turn.run
      if goaled?
        puts "congratulation!!"
        puts
        break
      end
    end
  end

  private

  def goaled?
    goal = @map.goal_point
    @unit.pos == goal
  end
end
