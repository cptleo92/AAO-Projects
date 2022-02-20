class HumanPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        puts "Enter a position as 2 numbers with a space between them"
        chosen = false
        while chosen == false
            choice = gets.chomp.split(" ").map(&:to_i)
            if legal_positions.include?(choice) == false
                puts "Can't do that!"
            else
                chosen = true
                return choice
            end
        end

    end 

end

# positions = [[1,2],[2,1],[0,0],[1,0]]

# leo = HumanPlayer.new('L')
# leo.get_position(positions)