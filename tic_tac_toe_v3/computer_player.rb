class ComputerPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)        
        choice = legal_positions.sample     
        puts "Computer has chosen #{choice}."
        return choice
    end 


end

