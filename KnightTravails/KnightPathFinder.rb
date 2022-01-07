require_relative "./PolyTreeNode.rb"

class KnightPathFinder  

  attr_accessor :start_pos, :considered_pos, :root_node

  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(@start_pos)      
    @considered_pos = [start_pos]
    build_move_tree      
  end
  
  def build_move_tree    
    build_queue = [@root_node]
    until build_queue.empty?
      start = build_queue[0]

      new_move_positions(start.value).each do |move| 
        new_move = PolyTreeNode.new(move)
        start.add_child(new_move)
        build_queue << new_move
      end
      build_queue.shift   
    end

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

  def find_path(end_pos)
    end_node = @root_node.dfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = [end_node.value]
    next_node = end_node.parent
    while next_node
      path.unshift(next_node.value)
      next_node = next_node.parent
    end
    p path
  end
end

kpf = KnightPathFinder.new([0, 0])
kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

# p k.root_node.children
# k.root_node.children.each do |x|
#     puts "i am " + x.value.to_s
#     puts "my children are"
#     p x.children
#     puts "--------"
# end
