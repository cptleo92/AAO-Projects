require_relative "hand.rb"

class Player 

    attr_reader :name, :deck
    attr_accessor :hand, :pot

  def initialize(name, pot, deck)
    @name = name
    @pot = pot
    @deck = deck    
    @hand = Hand.new(deck)    
  end

  def player_draw
    until @hand.length == 5
      @hand << @deck.draw!
    end
  end

  def calc_score
    @hand.calc_score
  end
  
  def discard
    puts "Choose cards to discard (i.e. 3 or 2 4 or 1 3 5)"
    puts "0 to keep all"
    print "> "
    chosen = gets.chomp.split(" ").map(&:to_i)
    @hand.discard(chosen)
    player_draw
  end

  def prompt(bet)
    puts "#{@name}, it is your turn. Current bet is #{bet}."
    @hand.render
    puts "You have #{@pot} chips."
    puts "Call, raise, or fold? (c/r/f)"

    ans = gets.chomp.downcase
    case ans
    when "c" 
      @pot -= bet    
      return "call"
    when "r"
      @pot -= bet + 1    
      return "raise"
    when "f"
      return "fold"
    end        
  end

end