require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, idx|
      4.times {cup << :stone} unless idx == 6 || idx == 13      
    end  
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,13)    
    raise "Starting cup is empty" if cups[start_pos] == [] 
          
  end
  

  def make_move(start_pos, current_player_name)    
    stones_in_hand = []
    cups[start_pos], stones_in_hand = stones_in_hand, cups[start_pos]
    side = current_player_name
    next_pos = start_pos
    until stones_in_hand.empty?    
      next_pos = (next_pos + 1) % 14
      if side == @name1
        cups[next_pos] << stones_in_hand.pop unless next_pos == 13 
      end
      if side == @name2
        cups[next_pos] << stones_in_hand.pop unless next_pos == 6 
      end          
    end
    # byebug
    render     
    next_turn(next_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13    
    return :switch if cups[ending_cup_idx].length == 1   

    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    winner = cups[6] <=> cups[13]
    if winner == 1
      @name1
    elsif winner == -1
      @name2
    else
      :draw
    end
  end
end
