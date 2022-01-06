require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    attr_reader :player_1_mark, :player_2_mark, :current

    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = player_1_mark
        @player_2_mark = player_2_mark
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current = @player_1
    end

    def switch_turn
        if @current == @player_1
            @current = @player_2
        else @current = @player_1
        end            
    end

    def play

        while @board.empty_positions?
            @board.print
            pos = @current.get_position
            @board.place_mark(pos, @current.mark_value)
            if @board.win?(self.player_1_mark)
                @board.print
                puts "Victory! Congratulations, Player 1!"
                return
            elsif @board.win?(self.player_2_mark)
                @board.print
                puts "Victory! Congratulations, Player 2!"
                return    
            else
                switch_turn
            end
        end

        puts "draw"

    end

end

game = Game.new(:X, :O)
game.play

