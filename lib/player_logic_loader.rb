class PlayerLogicLoader
  def initialize #(user_logic_file)
    #@file = user_logic_file
  end

  def load
    @player_logic = PlayerLogic::Base.new(character)
  end

  def play
    @player_logic.play
  end
end
