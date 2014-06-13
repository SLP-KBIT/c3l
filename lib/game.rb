require 'bundler'
Bundler.require

%w(map unit point).each do |file|
  require File.expand_path("../#{file}", __FILE__)
end

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
