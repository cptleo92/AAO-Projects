require_relative "piece.rb"

class King < Piece
  
  include Stepable

  def symbol
    :K
  end

#   private
#   def move_diffs
    
#   end

end