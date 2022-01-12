require 'rspec'
require 'player.rb'
require 'deck.rb'

describe Player do
  let(:deck) { Deck.new }
  subject(:player) { Player.new("Leo", 20, deck) }
  let(:player2) { Player.new("Cat", 20, deck) }
  let(:game) do
     double("game", 
     :pot => 20, 
     :players => [player, player2], 
     :current_bet => 1 ) 
    end
  let(:card1) { double("card1") }
  let(:card2) { double("card2") }
  let(:card3) { double("card3") }
  let(:card4) { double("card4") }
  let(:card5) { double("card5") }
  let(:card6) { double("card6") }
  let(:card7) { double("card7") }
  let(:hand) { double("hand", :cards => [card1, card2, card3, card4, card5]) }
  

  describe "#initialize" do  
    it "takes in a player name" do
      expect(player.name).to eq("Leo")
    end

    it "takes in a starting pot" do
      expect(player.pot).to eq(20)
    end

    it "creates a starting hand" do
      expect(player.hand.length).to eq(5)
    end

    it "references the deck being used" do
      expect(player.deck).to eq(deck)
    end
  end

  

#   describe "#prompt" do
#     it "gets input from the player"  

#   end

  describe "#player_draw" do    
    it "refills the player's hand to 5 cards" do
      player.hand = [card1, card2]
      expect(deck).to receive(:draw!)
      expect(deck).to receive(:draw!)
      expect(deck).to receive(:draw!)
      player.player_draw
      expect(player.hand.length).to eq(5)
    end
  end

  describe "#fold" do
    it "removes the player from the round" do

    end

  end

  describe "#call" do
    it "matches the current bet" do

    end
  end

  describe "#raise" do
    it "raises the current bet by 1" do

    end
  end

  describe "#discard" do
    it "discards the chosen cards and refills to 5" do

    end
  end

end