require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display
   attr_reader :board
   attr_accessor :cursor

    def initialize
      @board = Board.new
      @cursor = Cursor.new([0,0], @board)
    end

    def render
        puts "  0 1 2 3 4 5 6 7".colorize(:green)
        @board.rows.each_with_index do |row, idx|
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
        str += "#{space.symbol} "
        end   
      end
      str
    end

end

display = Display.new
display.render


display.board.move_piece(:white, [1,1], [2,1])
display.render
display.board.move_piece(:white, [0,1], [2,2])
display.render
display.board.move_piece(:white, [0,2], [2,0])
display.render
display.board.move_piece(:white, [2,0], [6,4])
display.render
p display.board.in_check?(:white)
display.board.move_piece(:white, [2,2], [4,3])
display.board.move_piece(:white, [4,3], [6,2])
display.render
p display.board.in_check?(:white)
display.board.move_piece(:white, [7,3], [6,2])
display.render
p display.board.in_check?(:white)