class Card 

  SUITS = [:S, :D, :C, :H]
  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  attr_reader :value, :suit, :score

  def initialize(value, suit)
    @value = value
    @suit = suit
    @score = get_score
  end

#   def to_s
    
#   end

  def inspect
   {'value' => @value, 'suit' => @suit }.inspect
  end

  def get_score    
    if VALUES[0..8].include?(value)
        return value.to_i
    elsif value == "J"
        return 11
    elsif value == "Q"
        return 12
    elsif value == "K"
        return 13
    elsif value == "A"
        return 14
    end
  end


end