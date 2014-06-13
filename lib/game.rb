require 'bundler'
Bundler.require

%w(map unit point visualizer).each do |file|
  require File.expand_path("../#{file}", __FILE__)
end

class Game
  attr_reader :map
  def initialize
    @map = Map.new(5)
    @unit = Unit.new
  end

  def show_map
    visualizer = Visualizer.new(map: @map, unit: @unit)
    visualizer.visualize
  end

  def run
    puts show_map
  end
end
