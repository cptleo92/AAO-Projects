require_relative "./board.rb"
# require_relative "./game.rb"

class HumanPlayer

    def initialize
        
    end

    def guess_pos(valid_arr)
        puts "Enter a position (i.e. 2,3 or 0,0 or 1,2)"

        valid = false
        while valid == false
            pos = gets.chomp.split(",").map(&:to_i)
            if pos.length != 2
                puts "typo?"
            elsif !valid_arr.include?(pos)
                puts "not a valid position!"
            else
                valid = true  
            end
        end
        pos
    end

end