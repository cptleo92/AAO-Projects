require_relative "piece.rb"

class Pawn < Piece
  
  

  def symbol
    :P  
  end

  def moves    
    moves = []
    moves += forward_steps + side_attacks    
    
  end

  def at_start_row?
    x, y = self.pos
    (self.color == :white && x == 6) || (self.color == :black && x == 1)
  end

  private
  def forward_dir
    return -1 if self.color == :white
    return 1 if self.color == :black
  end

  def forward_steps        
    byebug
    x, y = self.pos
    moves = [[x + forward_dir, y]]
    moves << [x + forward_dir * 2, y] if at_start_row? && @board.empty?([x + forward_dir, y])
    moves.select! {|move| @board.valid_pos?(move)}
    moves.select {|pos| @board.empty?(pos)}
  end

  def side_attacks
    
    x, y = self.pos
    moves = [[x+1, y + forward_dir],[x+1, y - forward_dir]]
    moves.select! {|move| @board.valid_pos?(move)}
    moves.select do |pos| 
        !@board.empty?(pos) && @board[pos].color != self.color
    end    
  end

end