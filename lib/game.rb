require 'bundler'
Bundler.require

require File.expand_path('../map', __FILE__)
require File.expand_path('../unit', __FILE__)

class Game
  attr_reader :map
  def initialize
    @map = Map.new(5)
  end

  def show_map
    @map.map { |line|
      line.map { |cell|
        str = ' ' if cell.color == :clear
        str ||= Rainbow(' ').bg(cell.color)
      }.join
    }.join("\n")
  end

  def run
    puts show_map
  end
end
