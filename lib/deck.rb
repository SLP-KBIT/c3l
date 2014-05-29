require File.expand_path("../card", __FILE__)

class Deck
  def initialize
    @hand    = Hand.new
    @stock   = Stock.new
    @discard = Discard.new
  end

  def refill_hand(number = 1)
    number.times do
      supplied_cards = @stock.supply
      @hand.refill(supplied_cards)
    end
  end

  def refill_stock
  end
end

class Hand
  AMOUNT = 3

  def initialize
    @cards = []
  end

  def refill
  end

  def discard
  end

  def empty?
    @cards.empty?
  end
end


class Stock
  AMOUNT = 30

  def initialize
    @cards = []
    AMOUNT.times do
      @cards.push Card.new(Card::COLORS.sample)
    end
  end

  def supply

    @cards.shift
  end

  def empty?
    @cards.empty?
  end

  def refill()

  end

end

class Discard
  attr_reader :cards

  def initialize
    @cards = []
  end

  def recieve(card)
    @cards.push card
  end

  def back
    @cards = []
  end
end
