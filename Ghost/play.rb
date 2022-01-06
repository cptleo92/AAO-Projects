require_relative "./game.rb"

class Play

    def initialize
        puts "Pick the first letter: "
        @letter = gets.chomp

        puts "Player 1's name: "
        @p1 = gets.chomp
        puts "Player 2's name: "
        @p2 = gets.chomp        


        game = Game.new(@letter, @p1, @p2)
        game.play_round
    end


end

Play.new