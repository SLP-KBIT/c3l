require 'bundler'
Bundler.require

%w(cell map player_logic_loader player_logic point turn unit round ui visualizer).each do |file|
  require File.expand_path("../#{file}", __FILE__)
end

class Game
  def initialize
  end

  def run
    Round.new.run
  end
end
