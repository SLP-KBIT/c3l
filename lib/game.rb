require 'bundler'
Bundler.require

%w(map unit point visualizer turn).each do |file|
  require File.expand_path("../#{file}", __FILE__)
end

class Game
  attr_reader :map
  def initialize
    @map = Map.new 5
    @unit = Unit.new @map.start_point
  end

  def run
    loop do
      turn = Turn.new(map: @map, unit: @unit)
      turn.run
    end
  end

end
