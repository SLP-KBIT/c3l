require 'spec_helper'
require 'card'

describe Card do
  subject(:blue) { Card.new(Card::COLOR_BLUE) }
  subject(:red) { Card.new(Card::COLOR_RED) }

  describe ".red?" do
    context "blue cell" do
      it { expect(blue.red?).to be_false }
    end

    context "red cell" do
      it { expect(red.red?).to be_true }
    end
  end

  describe ".blue?" do
    context "blue cell" do
      it { expect(blue.blue?).to be_true }
    end

    context "red cell" do
      it { expect(red.blue?).to be_false }
    end
  end
end
