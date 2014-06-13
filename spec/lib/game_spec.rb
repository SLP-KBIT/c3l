require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { Game.new }
  describe ".show_map" do
    it { expect(game.show_map).to be_kind_of String }
  end
end
