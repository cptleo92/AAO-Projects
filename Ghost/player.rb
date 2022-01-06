class Player 
    attr_reader :name    
    attr_accessor :losses

    def initialize(name)
        @name = name
        @losses = 0
        @ghost = ""
    end

    def guess
        gets.chomp
    end

    def ghostify
        if @losses == 1
            @ghost = "G"
        elsif @losses == 2
            @ghost = "GH"
        elsif @losses == 3
            @ghost = "GHO"
        elsif @losses == 4
            @ghost = "GHOS"
        elsif @losses == 5
            @ghost = "GHOST"
        end
        @ghost
    end
    
 end

