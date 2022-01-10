require_relative "pieces.rb"
require "colorize"
require "byebug"

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8) {[]} }
    @null_piece = NullPiece.instance

    (0..7).each do |row|
      (0..7).each do |col|
         if row.between?(2,5)
            rows[row][col] = @null_piece
         elsif row == 0 || row == 1
            rows[row][col] = Piece.new(:black, @rows, [row,col])        
         else 
            rows[row][col] = Piece.new(:white, @rows, [row,col])   
         end
      end

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

  def move_piece(start_pos, end_pos)
    raise "Start position is not valid!" unless valid_pos?(start_pos)
    raise "There is no piece at the start!" if self[start_pos] == @null_piece
    raise "End position is not valid!" unless valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = @null_piece   
  end

  def valid_pos?(pos)
    x,y = pos[0],pos[1]
    return true if x.between?(0,7) && y.between?(0,7)
    false
  end

  def render
    puts "  0 1 2 3 4 5 6 7".colorize(:green)
    rows.each_with_index do |row, idx|
      puts "#{idx.to_s.colorize(:green)} " + stringify(row)
    end
  end

  def stringify(row)
    # byebug
    str = ""
    row.each do |space|
      if space == @null_piece
        str += "  "
      else
        str += "P " 
      end   
    end
    str
  end

end

# board = Board.new
# board.move_piece([6,3],[4,5])
# board[[4,4]] = Piece.new
# board.render

# knight = Knight.new(:black, board, [3,4])