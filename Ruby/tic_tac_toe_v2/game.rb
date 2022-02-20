require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    attr_reader :player_marks, :current

    def initialize(boardsize, *player_marks)
        @players = player_marks.map do |p|
            HumanPlayer.new(p) 
         end
     
        @board = Board.new(boardsize)
        @current = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current = @players[0]            
    end

    def play

        while @board.empty_positions?
            @board.print
            pos = @current.get_position
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

game = Game.new(3, 'A', 'B')
game.play

