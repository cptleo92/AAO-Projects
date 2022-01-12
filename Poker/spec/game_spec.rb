require 'rspec'
require 'game.rb'

describe Game do
  subject(:game) { Game.new(2) }
  let(:player1) { double("player1") }
  let(:player2) { double("player2") }
  let(:deck) { double("deck"), :length => 52 }

  describe "#initialize" do
    it "starts with a shuffled deck" do
      expect(game.deck.length).to eq(52)
    end
    
    it "keeps track of the players" do
      expect(game.players.length).to eq(2)
    end

    it "keeps track of the current player" do
      expect(game.current_player).to eq(player1)
    end

    it "keeps track of the round" do
      expect(game.round).to eq(1) 
    end    

    it "keeps track of the pot" do
      expect(game.pot).to be(Integer)
    end
  end 
 
  describe "#switch_turn" do
    it "rotates the player array" do
      game.players = [player1, player2]    
      game.switch_turn
      expect(game.players).to eq([player2, player1])
      expect(game.current_player).to eq(player2)
    end 
  end

  describe "#over?" do
    context "when round 2 is over" do
      game.round = 3
  
      it "returns true" do
        expect(game.over?).to be_true
      end
    end
  end

  describe "#declare_winner" do
    it "returns the winner" 

    it "gives the pot to the winner" do
      expect(game.pot).to eq(0)
    end
  end



end