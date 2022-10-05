require_relative "piece.rb"

class Rook < Piece
  
  include Slideable

  def symbol
    :R
  end

  private
  def move_dirs
    horizontal_dirs
  end

end