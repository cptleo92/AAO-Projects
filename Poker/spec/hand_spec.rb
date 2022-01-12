require 'rspec'
require 'hand.rb'

describe Hand do
  subject(:hand) { Hand.new }

  describe "#initialize" do
   it "starts with an empty array" do
     expect(hand.cards).to eq([]) 
   end

   it "has a hand score" do
     expect(hand.score).to eq[0]
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