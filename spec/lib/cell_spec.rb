require 'spec_helper'
require 'cell'

shared_examples_for "colored cell" do
  subject(:clear) { target.new(:clear) }
  subject(:blue)  { target.new(:blue) }
  subject(:red)   { target.new(:red) }

  describe ".color" do
    context "clear cell" do
      it { expect(clear.color).to eq(:clear) }
    end

    context "blue cell" do
      it { expect(blue.color).to eq(:blue) }
    end

    context "red cell" do
      it { expect(red.color).to eq(:red) }
    end
  end
end

describe Cell::Base do
  let(:target) { Cell::Base }
  subject(:cell)  { target.new }

  describe ".type" do
    it { expect(cell.type).to eq(:base) }
  end

  it_should_behave_like "colored cell"
end

describe Cell::Normal do
  let(:target) { Cell::Normal }
  subject(:cell)  { target.new }

  describe ".type" do
    it { expect(cell.type).to eq(:normal) }
  end

  it_should_behave_like "colored cell"
end

describe Cell::Start do
  let(:target) { Cell::Start }
  subject(:cell)  { target.new }

  describe ".type" do
    it { expect(cell.type).to eq(:start) }
  end

  it_should_behave_like "colored cell"
end

describe Cell::Goal do
  let(:target) { Cell::Goal }
  subject(:cell)  { target.new }

  describe ".type" do
    it { expect(cell.type).to eq(:goal) }
  end

  it_should_behave_like "colored cell"
end
