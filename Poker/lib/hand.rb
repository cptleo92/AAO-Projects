require_relative "deck.rb"

class Hand 

  attr_reader :deck
  attr_accessor :cards, :score  

  def initialize(deck)
    @deck = deck
    @cards = []
    @score = 0
  end

  def discard(num)
    raise "too many discards!" if num.length > 5
    raise "invalid space!" unless num.all? { |x| x.between?(1,5)}
    num.map! { |x| x-1 }
    @cards.reject! do |card|
       idx = @cards.index(card)
       num.include?(idx)
    end    
  end

  def draw
    @cards << @deck.draw!
  end

end