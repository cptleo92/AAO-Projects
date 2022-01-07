class Tile

  attr_accessor :value, :mine, :revealed

  def initialize
    @value = "*"
    @mine = false
    @revealed = false
  end

  def set_mine
    @mine = true
    # @value = "X".colorize(:red)
  end

#   def tile_reveal
#     @revealed = true
#     @value = " "
#   end

end