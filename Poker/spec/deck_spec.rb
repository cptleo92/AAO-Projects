require 'rspec'
require 'deck.rb'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do 
    it "creates an array of 52 cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      original = deck.cards.dup
      deck.shuffle!  
      expect(deck.cards).to_not eq(original)      
    end
  end

  describe "#draw!" do
    it "draws a card from the top of the deck" do
      deck.draw!
      expect(deck.cards.length).to eq(51)
    end

    # it "returns a card" 

  end

end