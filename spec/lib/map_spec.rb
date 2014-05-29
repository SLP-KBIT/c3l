require 'spec_helper'
require 'map'

describe Map do
  subject(:default_map) { Map.new }
  subject(:size_given)  { Map.new(10) }

  describe ".size" do
    context "default map" do
      it { expect(default_map.size).to eq(3) }
      it { expect(default_map.cells.first.size).to eq(3) }
      it { expect(default_map.cells.map(&:first).size).to eq(3) }
    end

    context "given map size" do
      it { expect(size_given.size).to eq(10) }
      it { expect(size_given.cells.first.size).to eq(10) }
      it { expect(size_given.cells.map(&:first).size).to eq(10) }
    end
  end

  describe "should have start in the top line" do
    it { expect(default_map.cells.first.select { |e| e.type == :start }.size ).to eq(1) }
  end

  describe "should have goal in the bottom line" do
    it { expect(default_map.cells.last.select { |e| e.type == :goal }.size ).to eq(1) }
  end

end
