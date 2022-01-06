require_relative "./dictionary.rb"
require_relative "./player.rb"
require_relative "./AiPlayer.rb"
require "byebug"

class Game 
    attr_reader :fragment, :fragment_first, :current, :word_list
 

    def initialize(first_letter = "s", *players)
                   
        @dictionary = Dictionary.new
        @word_list = @dictionary[first_letter]
        @fragment = first_letter
        @fragment_first = first_letter

        @players = []
        players.each do |p|
             
                @players << Player.new(p)
            
        end
        @players << AiPlayer.new("Henry")
        @current = @players[0]
    end


    def switch_player
        @players.rotate!
        @current = @players[0]
    end

    def take_turn(player)
        puts "#{player.name}, it is your turn. Pick a letter."
        
        chosen = false
        while chosen == false
            letter = player.guess
            if valid_play?(letter)
                @fragment_first = letter if @fragment_first == ""
                @fragment += letter
                chosen = true
                
            else
                puts "Not a word! Try again."
            end
        end
    end

    def valid_play?(string)
        alpha = ('a'..'z').to_a
        check = @fragment + string
        
        if alpha.include?(string) && @word_list.any? {|x| x.start_with?(check)} 
            return true
        else               
            return false
        end
    end

    def play_round

        while !@word_list.include?(@fragment)
            
            puts "Letters so far: " + @fragment
            puts "------------------"
            take_turn(@current)

            if @word_list.include?(@fragment)
               
                puts "Letters so far: " + @fragment
                puts "------------------"
                puts "#{@current.name} loses!"        
                round_over(@current)                
            else
                switch_player
            end

        end
    end

    def round_over(player)

        player.losses += 1

        @players.each do |p|
            puts "#{p.name} is: " + p.ghostify
        end

        if player.losses == 3
            puts "Game over, #{player.name}!"
            @players.delete(player)
            @current = @players[0]
            if @players.length == 1
                puts "Congratulations, #{@players[0].name}!"
                return
            end
        end

        puts "Pick a new letter:"
        new_letter = gets.chomp
        @fragment = new_letter 
        @fragment_first = new_letter 
        @word_list = @dictionary[new_letter]
        play_round

    end

end

