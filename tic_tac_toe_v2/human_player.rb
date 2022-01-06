class HumanPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "Enter a position as 2 numbers with a space between them"
        gets.chomp.split(" ").map(&:to_i)
    end 






end
