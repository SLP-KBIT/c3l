require File.expand_path("../card", __FILE__)

module Deck
  class Deck
    attr_reader :hand, :stock, :discard

    def initialize
      @hand    = Hand.new
      @stock   = Stock.new
      @discard = Discard.new
    end

    def refill_stock
      @discard.flush.each { |card| @stock.take card }
    end

    def draw
      @hand.take @stock.offer
    end

    def discard(card)
      #
    end

  end

  class Base
    attr_reader :cards

    def initialize
      @cards = []
    end

    def take(card)
      @cards.push card
    end

    def offer(card=nil)
      raise 'cannot pull any card, it is emply.' if @cards.empty?
      return @cards.shift if card.nil?
    end
  end

  class Hand < Base
    AMOUNT = 3
  end


  class Stock < Base
    AMOUNT = 30
    def initialize
      super
      AMOUNT.times { @cards.push Card.new }
    end
  end

  class Discard < Base
    def flush
      cards = @cards
      @cards = nil
      cards
    end
  end
end
