require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    attr_reader :player_marks, :current

    def initialize(boardsize, player_marks)
        @players = []
        player_marks.each do |mark, real|
            if real 
                @players << HumanPlayer.new(mark)
            else
                @players << ComputerPlayer.new(mark)
            end
        end
     
        @board = Board.new(boardsize)
        @current = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current = @players[0]            
    end

    require "byebug"
    def play

        while @board.empty_positions?
            @board.print
            
            pos = @current.get_position(@board.legal_positions)
            @board.place_mark(pos, @current.mark_value)
            if @board.win?(@current.mark_value)
                @board.print
                puts "Victory! Congratulations, Player #{@current.mark_value}!"
                return              
            else
                switch_turn
                puts "Player #{@current.mark_value}'s turn."
            end
        end
        @board.print
        puts "draw"

    end

end

game = Game.new(5, H: false, P: false, G: false)
game.play

# game = Game.new(3, X: false, O: true)
# # game.play