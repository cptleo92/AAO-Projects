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

#    it "has a hand score" do
#      expect(hand.score).to eq(0)
#    end      
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

  describe "#sort!" do 
    let(:card1) { Card.new("A", :H)}
    let(:card2) { Card.new("10", :H)}
    let(:card3) { Card.new("J", :H)}
    let(:card4) { Card.new("7", :H)}    
    let(:card5) { Card.new("4", :H)}   
    let(:h) { Hand.new(deck) }
    it "sorts hand from lowest to highest" do
      h.cards = [card1, card2, card3, card4, card5]
      h.sort!
      expect(h.cards).to eq([card5, card4, card2, card3, card1])
    end
  end

  describe "#high_card" do
    let(:card1) { Card.new("4", :H)}
    let(:card2) { Card.new("K", :H)}
    let(:card3) { Card.new("J", :H)}
    let(:card4) { Card.new("7", :H)}    
    let(:h) { Hand.new(deck) }
    it "returns score of highest card in hand" do
      h.cards = [card1, card2, card3, card4]
      expect(h.high_card).to eq(card2)
    end
  end

  describe "#calc_score" do
    let(:card1) { Card.new("K", :H)}
    let(:card2) { Card.new("A", :H)}
    let(:card3) { Card.new("A", :D)}
    let(:card4) { Card.new("A", :H)}
    let(:card5) { Card.new("J", :H)}       
    it "checks for any combinations" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.royal_flush?).to be true
    end
    it "should return integer score value" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.calc_score).to eq(108)
    end
  end

  describe "#royal_flush?" do
    let(:card1) { Card.new("K", :H)}
    let(:card2) { Card.new("10", :H)}
    let(:card3) { Card.new("A", :H)}
    let(:card4) { Card.new("Q", :H)}
    let(:card5) { Card.new("J", :H)}        
    # let(:h) { Hand.new(deck) }
    it "checks for a royal flush" do
        hand.cards = [card1, card2, card3, card4, card5]
        expect(hand.royal_flush?).to be true
    end
  end

  describe "#straight_flush?" do
    let(:card1) { Card.new("K", :H)}
    let(:card2) { Card.new("10", :H)}
    let(:card3) { Card.new("9", :H)}
    let(:card4) { Card.new("Q", :H)}
    let(:card5) { Card.new("J", :H)}        
    let(:h) { Hand.new(deck) }
    it "checks for a straight flush" do
      h.cards = [card1, card2, card3, card4, card5]
      expect(h.straight_flush?).to be true
    end
  end

  describe "#four_kind?" do
    let(:card1) { Card.new("4", :H)}
    let(:card2) { Card.new("4", :H)}
    let(:card3) { Card.new("4", :H)}
    let(:card4) { Card.new("5", :H)}
    let(:card5) { Card.new("7", :H)}        
    let(:h) { Hand.new(deck) }
    it "checks for a four of a kind" do
      h.cards = [card1, card2, card3, card4, card5]
      expect(h.four_kind?).to be false
    end
  end

  describe "#full_house?" do
    let(:card1) { Card.new("4", :H)}
    let(:card2) { Card.new("4", :H)}
    let(:card3) { Card.new("4", :H)}
    let(:card4) { Card.new("5", :H)}
    let(:card5) { Card.new("5", :H)} 
    it "checks for a full house" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.full_house?).to be true
    end
  end

  describe "#flush?" do
    let(:card1) { Card.new("4", :H)}
    let(:card2) { Card.new("4", :H)}
    let(:card3) { Card.new("4", :H)}
    let(:card4) { Card.new("5", :H)}
    let(:card5) { Card.new("7", :H)}        
    let(:h) { Hand.new(deck) }
    it "checks for a flush" do
      h.cards = [card1, card2, card3, card4, card5]
      expect(h.flush?).to be true
    end
  end

  describe "#straight?" do
    let(:card1) { Card.new("4", :H)}
    let(:card2) { Card.new("8", :H)}
    let(:card3) { Card.new("6", :S)}
    let(:card4) { Card.new("5", :D)}
    let(:card5) { Card.new("7", :H)}        
    let(:h) { Hand.new(deck) }
    it "checks for a straight" do
      h.cards = [card1, card2, card3, card4, card5]
      expect(h.straight?).to be true
    end
  end

  describe "#triplet?" do
    let(:card1) { Card.new("4", :H)}
    let(:card2) { Card.new("4", :H)}
    let(:card3) { Card.new("4", :H)}
    let(:card4) { Card.new("8", :H)}
    let(:card5) { Card.new("5", :H)}        
    it "checks for a triplet" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.triplet?).to be true
    end
  end

  describe "#two_pair?" do
    let(:card1) { Card.new("K", :H)}
    let(:card2) { Card.new("4", :H)}
    let(:card3) { Card.new("4", :H)}
    let(:card4) { Card.new("5", :H)}
    let(:card5) { Card.new("5", :H)} 
    it "checks for a two pair" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.two_pair?).to be true
    end

  end

  describe "#pair?" do
    let(:card1) { Card.new("A", :H)}
    let(:card2) { Card.new("8", :H)}
    let(:card3) { Card.new("6", :H)}
    let(:card4) { Card.new("5", :H)}
    let(:card5) { Card.new("5", :H)} 
  it "checks for a pair" do
    hand.cards = [card1, card2, card3, card4, card5]
    expect(hand.pair?).to be true
  end
  end
  

end