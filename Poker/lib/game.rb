# require_relative "hand.rb"
require_relative "player.rb"
require "byebug"

class Game

  attr_reader :deck
  attr_accessor :players, :round, :current_player, :pot, :bet

  def initialize(num_players)
    @deck = Deck.new
    @players = []
    create_players(num_players)
    @folded = []
    @round = 0
    @current_player = @players[0]
    @pot = 0
    @bet = 0
  end

  def create_players(num_players)
    (1..num_players).each do |num|
      puts "Player #{num}, please enter your name: "
      name = gets.chomp
      @players << Player.new(name, 20, deck)
    end
  end

  def switch_turn
    @players.rotate!
  end

  def find_winner
    # byebug
    scoring = {}
    @players.each { |p| scoring[p] = p.calc_score } # {p1 => 102, p2 => 104}    
    high_score = scoring.values.max
    winners = scoring.select { |player, score| score == high_score}
    declare_winner(winners.keys)    
  end

  def over?
    return true if @round == 3    
  end

  def declare_winner(player)
    if player.length == 1
      puts "#{player[0].name} wins #{@pot} chips."
      player[0].pot += @pot
      @pot = 0   
    else        
      num_winners = player.length
      puts "#{num_winners}-way tie!"
      player.each { |p| p.pot += (@pot / num_winners) }
      @pot = 0
    end
  end
  
end