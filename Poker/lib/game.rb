# require_relative "hand.rb"
require_relative "player.rb"
require "byebug"

class Game

  attr_reader :deck
  attr_accessor :players, :round, :current_player, :pot, :bet

  def initialize
    @deck = Deck.new
    @players = [Player.new("Leo", 2, deck), Player.new("Cat", 2, deck), Player.new("Henry", 2, deck)]
    # create_players(num_players)
    @folded = []    
    @round = 0    
    @pot = 0
    @bet = 1
  end

#   def create_players(num_players)
#     (1..num_players).each do |num|
#       puts "Player #{num}, please enter your name: "
#       name = gets.chomp
#       @players << Player.new(name, 20, deck)
#     end
#   end

  def switch_turn
    @players.rotate!  
  end

  def play_round   
    @players.each do |player|
      next if over?
      player.player_draw
      puts "Bet 1"
      player_prompt(player, @bet)   
      player.discard unless @folded.include?(player)        
    end
    puts "Round 1 of betting over!"
    unless over?
      puts "Pot has #{pot} chips."
      @players.each do |player|
        next if over?
        unless @folded.include?(player)          
          puts "Bet 2"
          player_prompt(player, @bet)
        end              
      end     
    end      
    if over?
        default_winner
    else 
        find_winner
    end
    reset_round
  end

  def reset_round
    @players.each { |p| bust_out(p) }
    @deck = Deck.new
    @players.each { |p| p.hand = Hand.new(deck)}
    @bet = 1
    @pot = 0
    @round = 0
    @folded = []
    switch_turn    
  end

  def play
    until @players.length == 1
      play_round      
    end    
    puts "#{@players[0].name} is the last one standing!"
  end


  def bust_out(player)
    if player.pot <= 0
        puts "#{player.name} can't afford to keep playing!"
        @players.delete(player)
    end
  end

  def default_winner
    winner = @players.reject { |p| @folded.include?(p) }
    declare_winner(winner)
  end
  
  def find_winner
    # byebug
    scoring = {}
    @players.each do |p| 
        scoring[p] = p.calc_score unless @folded.include?(p)
      end # {p1 => 102, p2 => 104}    
    high_score = scoring.values.max
    winners = scoring.select { |player, score| score == high_score}
    declare_winner(winners.keys)    
  end

  def over?
    (@folded.length == @players.length - 1) || @round == 2
  end

  def declare_winner(player)
    if player.length == 1
      puts "#{player[0].name} wins #{@pot} chips."
      player[0].pot += @pot
      @pot = 0   
    else        
      num_winners = player.length
      puts "#{num_winners}-way tie! #{@pot / num_winners} chips to the winners."
      player.each { |p| p.pot += (@pot / num_winners) }
      @pot = 0
    end
  end

  def player_prompt(player, bet)
    # byebug
    answer = player.prompt(bet) 
    case answer
    when "raise"
      @bet += 1
      @pot += @bet
    when "call"
      @pot += @bet
    when "fold"
      fold(player)
    end
  end

  def fold(player)
    puts "#{player.name} folds!"
    @folded << player
    # p @folded
  end
  
end

game = Game.new
game.play