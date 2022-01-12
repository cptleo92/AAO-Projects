require 'rspec'
require 'hand.rb'

describe Hand do
  let(:deck) { double("deck")}
  subject(:hand) { Hand.new(deck) }
  let(:card1) { double("card1") }
  let(:card2) { double("card2") }
  let(:card3) { double("card3") }
  let(:card4) { double("card4") }
  let(:card5) { double("card5") }
  

  describe "#initialize" do
   it "starts with an empty array" do
     expect(hand.cards).to eq([]) 
   end

   it "has a hand score" do
     expect(hand.score).to eq(0)
   end      
  end 

  describe "#discard" do
    before(:each) { hand.cards = [card1, card2, card3, card4, card5] }
    it "removes cards from hand according to array arg" do      
      hand.discard([1,3,5])
      expect(hand.cards).to eq([card2, card4])
    end

    it "raises an error if the argument is invalid" do
      expect {hand.discard([0])}.to raise_error("invalid space!")
      expect {hand.discard([6])}.to raise_error("invalid space!")
      expect {hand.discard([1,2,3,4,5,6])}.to raise_error("too many discards!")
    end
  end

  describe "#draw" do
    it "adds a card to the hand" do
      hand.cards = [card1, card2, card3]
      allow(deck).to receive(:draw!).and_return(card4)
      hand.draw
      expect(hand.cards.length).to eq(4)
    end
  end  

  describe "#calc_score" do
    it "checks for any combinations"

    it "should return integer score value" 
  end

  describe "#royal_flush?" do
    it "checks for a royal flush"
  end

  describe "#straight_flush?" do
    it "checks for a straight flush"
  end

  describe "#four_kind?" do
    it "checks for a four of a kind"
  end

  describe "#full_house?" do
    it "checks for a full house"
  end

  describe "#flush?" do
    it "checks for a flush"
  end

  describe "#straight?" do
    it "checks for a straight"
  end

  describe "#triplet?" do
    it "checks for a triplet"
  end

  describe "#two_pair?" do
    it "checks for a two pair"
  end

  describe "#pair?" do
    it "checks for a pair"
  end
  

end