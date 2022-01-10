# require_relative "board.rb"

class Piece
  attr_accessor :pos
  attr_reader :color, :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos    
  end

  def to_s
    
  end

  def empty?
    false
  end

  def valid_moves
    moves
  end

  def pos=(val)
    @board[pos] = val
  end

  def symbol

  end

  private
  def move_into_check?(end_pos)

  end

end


module Slideable
  HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]
  
  def horizontal_dirs    
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |diff|
      dx, dy = diff[0], diff[1]
      grow_unblocked_moves_in_dir(dx, dy).each {|x| moves << x}
    end
    moves
  end

  private

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = self.pos
    moves_in_dir = []            
    move = [cur_x, cur_y]
    next_move = [move[0] + dx, move[1] + dy] 
  # byebug
    while @board.valid_pos?(next_move)      
      if @board.empty?(next_move)
        moves_in_dir << next_move    
      elsif @board[next_move].color == self.color
        break 
      else
        moves_in_dir << next_move
        break
      end
      next_move = [next_move[0] + dx, next_move[1] + dy] 
    end
    
    moves_in_dir
  end

end

module Stepable
  def moves
    moves = []
    x, y = self.pos
    move_diffs.each do |diff|
      next_move = [x + diff[0], y + diff[1]]
      next unless @board.valid_pos?(next_move)
      moves << next_move if @board.empty?(next_move) || @board[next_move].color != self.color
    end
    moves
  end

  private
  def move_diffs
    moves_knight_diffs = [[-2,-1],[-2,1],[-1,-2],[-1,2],[2,-1],[2,1],[1,-2],[1,2]]
    moves_king_diffs = [
    [-1,-1],[-1,0],[-1,1],
    [0,1],[1,1],[1,0],
    [1,-1],[0,-1]
    ]
    return moves_knight_diffs if self.is_a?(Knight)
    return moves_king_diffs if self.is_a?(King)
  end
end