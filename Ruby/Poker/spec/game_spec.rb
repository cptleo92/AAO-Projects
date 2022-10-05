require 'rspec'
require 'game.rb'

describe Game do
  subject(:game) { Game.new(3) }
  let(:deck) { Deck.new }
  let(:player1) { Player.new("Leo", 20, deck) }
  let(:player2) { Player.new("Cat", 20, deck) }
  let(:player3) { Player.new("Henry", 20, deck) }
 

  describe "#initialize" do
    # it "starts with a shuffled deck" do
    #   expect(game.deck.length).to eq(52)
    # end
    
    it "keeps track of the players" do
      expect(game.players.length).to eq(3)
    end

    # it "keeps track of the current player" do      
    #   game.players = [player1, player2, player3]
    #   expect(game.current_player).to eq(game.players[0])
    # end

    it "keeps track of the round" do
      expect(game.round).to eq(0) 
    end    

    it "keeps track of the pot" do
      expect(game.pot).to be_an(Integer)
    end

    it "keeps track of current bet" do
      expect(game.bet).to be_an(Integer)
    end
  end 
 
  describe "#find_winner" do    
    it "returns player (or players) with winning hand" do
      game.players = [player1, player2, player3]
      expect(player1).to receive(:calc_score).and_return(106)
      expect(player2).to receive(:calc_score).and_return(106)
      expect(player3).to receive(:calc_score).and_return(105)
      expect(game).to receive(:declare_winner).with([player1, player2])
      game.find_winner
    end

    # it "calls #declare_winner on winners" do
       
    # end
  end

  describe "#declare_winner" do
    it "takes in a single winner and distributes pot" do     
      game.pot = 20
      game.declare_winner([player1])
      expect(player1.pot).to eq(40)      
      expect(game.pot).to eq(0)
    end

    it "takes in multiple winners and distributes pot" do     
      game.pot = 20
      game.declare_winner([player2, player3])
      expect(player2.pot).to eq(30)
      expect(player3.pot).to eq(30)
      expect(game.pot).to eq(0)
    end
  end

  # describe "#switch_turn" do
  #   it "rotates the player array" do
  #     game.players = [player1, player2]    
  #     game.switch_turn
  #     expect(game.players).to eq([player2, player1])
  #     expect(game.current_player).to eq(player2)
  #   end 
  # end

  describe "#over?" do
    context "when round 2 is over" do 
      it "returns true" do
        game.round = 3
        expect(game.over?).to be true
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