require_relative "board.rb"
require_relative "tile.rb"

class Game 

  def initialize 
    puts "Enter a grid size from easy (5) to hard (12):"
    print ">"

    size = nil
    until size && valid_size?(size)         
      size = gets.chomp.to_i
    end

    total_spaces = size * size
    num_mines = rand((total_spaces * 0.2)..(total_spaces * 0.3)).to_i

    # puts "Enter a difficulty (Easy, Medium, Hard):"
    # print ">"   
    
    # until diff
    # diff = parse_diff(gets.chomp,size)
    # end

    @board = Board.new(size,num_mines)
  end

  def valid_size?(num)
    num.between?(5,12)
  end

#   def parse_diff(diff,num_mines)
#     easy = ["easy", "e", "1"]
#     medium = ["medium", "m", "2"]
#     hard = ["hard", "h", "3"]
    
#     if easy.include?(diff) 
#         return rand((num_mines / 8)..(num_mines / 6))

#   end

  def play
    @board.render
    @board.prompt until won? || lost?
    puts "You win!" if won?
  end

  def won?
    @board.won?
  end

  def lost?
    @board.lost
  end
end

game = Game.new
game.play