require_relative "./PolyTreeNode.rb"

class KnightPathFinder  

  attr_accessor :current_pos, :considered_pos

  def initialize(start_pos)
    @current_pos = start_pos
    @root_node = PolyTreeNode.new(@current_pos)      
    @considered_pos = [start_pos]
    build_move_tree    
  end
  
  def build_move_tree
    
  end

  def self.valid_moves(pos)
    x, y = pos[0], pos[1]
    move_list = [[-2,-1], [-2,1], [-1,2], [-1,-2], [2,-1], [2,1], [1,2], [1,-2]]
    move_list.map! {|move| [move[0]+x, move[1]+y]}
    move_list.select! {|move| move[0].between?(0,8) && move[1].between?(0,8)}    
    move_list    
  end

  def new_move_positions(pos)
    valid_list = KnightPathFinder.valid_moves(pos)
    valid_list.reject! {|move| @considered_pos.include?(move)}
    @considered_pos += valid_list
    valid_list
  end

end

k = KnightPathFinder.new([2,1])
p k.new_move_positions(k.current_pos)
p k.considered_pos