require 'rspec'
require 'player.rb'

describe Player do
  subject(:player) { Player.new("Leo", 20) }
  let(:player2) { Player.new("Cat", 20) }
  let(:game) do
     double("game"), 
     :pot => 20, 
     :players => [player, player2], 
     :current_bet => 1 
  end
  let(:card1) { double("card1") }
  let(:card2) { double("card2") }
  let(:card3) { double("card3") }
  let(:card4) { double("card4") }
  let(:card5) { double("card5") }
  let(:card6) { double("card6") }
  let(:card7) { double("card7") }
  let(:hand) { double("hand"), :cards => [card1, card2, card3, card4, card5]}

  describe "#initialize" do
    it "takes in a player name" do
     
    end

    it "takes in a starting pot" do

    end

    it "creates a starting hand" do

    end

  end

#   describe "#prompt" do
#     it "gets input from the player"  

#   end

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