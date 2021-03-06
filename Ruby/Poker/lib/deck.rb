require_relative "card.rb"

class Deck

SUITS = [:S, :D, :C, :H]
VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"] 

  attr_accessor :cards

  def initialize
    @cards = []
    generate_deck
    shuffle!
    shuffle!
  end  
 
  def inspect
    self.length.inspect
  end

  def length
    @cards.length
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw!
    @cards.shift
  end

  private
  def generate_deck    
    VALUES.each do |val|
       SUITS.each do |suit|
          @cards << Card.new(val, suit)
       end
    end    
  end

end