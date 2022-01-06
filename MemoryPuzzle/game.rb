require_relative "./board.rb"
require_relative "./card.rb"
require_relative "./human.rb"
require_relative "./computer.rb"

class Game

    def initialize
        puts "Enter a size (must be an even number)"            
        size = gets.chomp.to_i
        @board = Board.new(size)
        @guess1 = []
        @guess2 = []
        @num_guesses = 0
        @matched = []

        @player = Computer.new
    end

    def prompt
        guess = @player.guess_pos(@board.valid_pos)
        p @player.known_cards
        flip_card(guess)        
        if @guess1 == []
            @guess1 = guess 
        else @guess2 = guess             
        end                  
    end

    def flip_card(pos)       
        x, y = pos
        card = @board.grid_hash[pos]
        @board.hiddengrid[x][y] = card.value
        card.reveal    
        unless @matched.include?(pos)
            @player.receive_revealed_card(pos,card.value)
        end
        @board.render
    end

    def hide_card(pos)
        x, y = pos
        card = @board.grid_hash[pos]
        @board.hiddengrid[x][y] = " "
        card.hide
        @board.render
    end

    def check_match
    
        card1 = @board.grid_hash[@guess1]          
        card2 = @board.grid_hash[@guess2]
        if card1.value == card2.value
            puts "It's a match!"
            @matched << @guess1
            @matched << @guess2
            # byebug
        else
            puts "Try again :("
            sleep(2)
            hide_card(@guess1)
            hide_card(@guess2)             
        end
        @guess1 = []
        @guess2 = [] 
      
    end

    def play
        
        until @board.won? 
            prompt
            @num_guesses += 1
            if @num_guesses == 2
                check_match
                @num_guesses = 0
            end
        end
       
        if @board.won?
            puts "You did it!"
            return
        end
    end


end

if __FILE__ == $PROGRAM_NAME
    game = Game.new
    game.play
end