require_relative "hand.rb"

class Player 

    attr_reader :name, :deck
    attr_accessor :hand, :pot

  def initialize(name, pot, deck)
    @name = name
    @pot = pot
    @deck = deck    
    @hand = Hand.new(deck)
    player_draw
  end

  def player_draw
    until @hand.length == 5
      @hand << @deck.draw!
    end
  end

  def calc_score
    @hand.calc_score
  end
  
  def discard
    chosen = [] # gets numbers [1,2,3,4,5]
    @hand.discard(chosen)
    player_draw
  end

end