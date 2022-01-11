require_relative "pieces.rb"
require "colorize"
require "byebug"

# TO DO
# Need to test pieces more and movesets
# Add pieces to board

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8) {[]} }
    @null_piece = NullPiece.instance

    (0..7).each do |row|
      (0..7).each do |col|
         if row.between?(2,5)
            rows[row][col] = @null_piece         
         end
      end
    end

    generate_pieces
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def generate_pieces
    add_piece(Rook.new(:white, self, [7,7]), [7,7])
    add_piece(Rook.new(:white, self, [7,0]), [7,0])
    add_piece(Rook.new(:black, self, [0,0]), [0,0])
    add_piece(Rook.new(:black, self, [0,7]), [0,7])
    add_piece(Knight.new(:white, self, [7,1]), [7,1])
    add_piece(Knight.new(:white, self, [7,6]), [7,6])
    add_piece(Knight.new(:black, self, [0,1]), [0,1])
    add_piece(Knight.new(:black, self, [0,6]), [0,6])
    add_piece(Bishop.new(:white, self, [7,2]), [7,2])
    add_piece(Bishop.new(:white, self, [7,5]), [7,5])
    add_piece(Bishop.new(:black, self, [0,2]), [0,2])
    add_piece(Bishop.new(:black, self, [0,5]), [0,5])
    add_piece(Queen.new(:white, self, [7,3]), [7,3])
    add_piece(Queen.new(:black, self, [0,3]), [0,3])
    add_piece(King.new(:white, self, [7,4]), [7,4])
    add_piece(King.new(:black, self, [0,4]), [0,4])
    (0..7).each do |num|
      add_piece(Pawn.new(:white, self, [6, num]), [6,num])
      add_piece(Pawn.new(:black, self, [1, num]), [1,num])
    end

  end

  def [](pos)
    rows[pos[0]][pos[1]]
  end
  
  def []=(pos, val)
    rows[pos[0]][pos[1]] = val
  end

  def empty?(pos)
    self[pos].empty?
  end

  def move_piece(color, start_pos, end_pos)
    moving = self[start_pos] 
    #error message if trying to pick wrong color
    raise "Start position is not valid!" unless valid_pos?(start_pos)
    raise "There is no piece at the start!" if moving == @null_piece
    raise "End position is not valid!" unless valid_pos?(end_pos)
    
    move_list = moving.valid_moves
    raise "Move is illegal" unless move_list.include?(end_pos)
    self[end_pos] = moving
    moving.pos = end_pos    
    self[start_pos] = @null_piece
  end

  def valid_pos?(pos)
    x,y = pos[0],pos[1]
    return true if x.between?(0,7) && y.between?(0,7)
    false
  end

  def in_check?(color)
    pos_king = find_king(color)
    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row,col]
        if self[pos].color != color
          return true if self[pos].moves.include?(pos_king)
        end
      end
    end
    false
  end

  def find_king(color)
    (0..7).each do |row|
      (0..7).each do |col|
        return [row, col] if self[[row,col]].is_a?(King) && self[[row,col]].color == color
      end
    end
  end

  # def checkmate?(color)
  #   if in_check?(color)
      
  #   end
  # end

end

