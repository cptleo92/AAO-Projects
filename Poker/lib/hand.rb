require "byebug"
require_relative "deck.rb"

class Hand 

  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"] 

  attr_reader :deck
  attr_accessor :cards, :score  

  def initialize(deck)
    @deck = deck
    @cards = []    
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

  def sort!
    @cards.sort_by! { |card| card.score }
  end

  def calc_score
    case 
    when royal_flush?
        108
    when straight_flush?
        107
    when four_kind?
        106
    when full_house?
        105
    when flush?
        104
    when straight?
        103
    when triplet?
        102
    when two_pair?
        101
    when pair?
        100
    else
        high_card.score
    end
  end

  def high_card    
    highest = @cards.inject do |card1, card2|
      card1.score > card2.score ? card1 : card2
    end
    highest
  end

  def royal_flush?
    high_card.value == "A" && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_kind?
    counter = Hash.new(0)
    @cards.each { |card| counter[card.value] += 1 }
    counter.any? { |val, count| count == 4}
  end

  def full_house?
    triplet? && pair?
  end

  def flush?
    suit = @cards[0].suit
    @cards.all? { |card| card.suit == suit}
  end

  def straight?
    sort!
    (0..3).each do |idx|
      return false unless @cards[idx].score == @cards[idx+1].score - 1       
    end
    true
  end

  def triplet?
    counter = Hash.new(0)
    @cards.each { |card| counter[card.value] += 1 }
    counter.any? { |val, count| count == 3}
  end

  def two_pair?
    counter = Hash.new(0)
    @cards.each { |card| counter[card.value] += 1 }
    counter.count { |val, count| count == 2} == 2
  end

  def pair?
    counter = Hash.new(0)
    @cards.each { |card| counter[card.value] += 1 }
    counter.one? { |val, count| count == 2}
  end
end