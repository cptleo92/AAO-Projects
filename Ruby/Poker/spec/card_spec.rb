require 'rspec'
require 'card.rb'

# ☘♠◆

describe Card do
  subject(:card) { Card.new("4", :H) }

  describe "#initialize" do
    it "initializes card with value and suit" do
      expect(card.value).to eq("4")
      expect(card.suit).to eq(:H)
    end

    it "has an integer score" do
      expect(card.score).to eq(4)
    end    
  end

#   describe "#to_s" do
#     let(:card2) { Card.new("K", :D)}
#     let(:card3) { Card.new("J", :S)}
#     it "return a string version of card" do
#       expect(card.to_s).to eq("Four of hearts")
#       expect(card2.to_s).to eq("King of diamonds")
#       expect(card3.to_s).to eq("Jack of spades")
#     end
#   end

  describe "#get_score" do
    let(:card2) { Card.new("A", :S)}
    it "returns integer score of card" do
      expect(card.get_score).to eq(4)
      expect(card2.get_score).to eq(14)
    end
  end

end