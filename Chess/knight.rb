require_relative "piece.rb"

class Knight < Piece
  
  include Stepable

  def symbol
    :H
  end

#   private
#   def move_diffs
    
#   end

end