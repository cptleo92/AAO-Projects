require_relative "./card.rb"
require "byebug"

class Board 

    attr_reader :height, :grid, :total_pairs, :cards, :hiddengrid, :grid_hash

    CARDS = ['J', 'Q', 'K', 'A', 'B', 'C', 'D', '4', '5', '6', '7', '8', '9', 'E','F','G','H','I','Z','U','Y']
    # CARDS = [:A, :B, :C, :D, :E, :F, :G, :H, :I, :J, :K, :L, :M, :N, :O, :P, :Q, :R, :S, :T, :U]

    def initialize(height)
        @height = height
        @grid = Array.new (height) {|x| Array.new(height) } # might not be necessary anymore
        @hiddengrid = Array.new (height) {|x| Array.new(height, " ") } # will be actual grid
        @total_pairs = (height * height) / 2
        @cards = generate_deck
        @grid_hash = {}

        populate
        render
        
    end

    def [](pos)
        x, y = pos
        @hiddengrid[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @hiddengrid[x][y] = value
    end

    def generate_deck
        deck = CARDS.shuffle
        play_deck = []
        (0...@total_pairs).each do |card_i|
            2.times { 
                card = Card.new(CARDS[card_i])
                play_deck << card
            }          
        end
        play_deck.shuffle!        
    end

    def render
        # system("clear")
        title = ""
        (0...@height).each do |x|
            title += " " + x.to_s            
        end
        puts title

        (0...@height).each do |y|
            puts y.to_s + @hiddengrid[y].join(" ")
        end
    end

    def populate
        (0...@height).each do |row|
            (0...@height).each do |col|
                # byebug
                pos = [row, col]
                @grid_hash[pos] = draw_card
                
            end
        end
    end

    def draw_card
        @cards.rotate!
        @cards[0]
    end

    def won?    
        cards = @grid_hash.values
        cards.all? {|card| card.face_up}        
    end

    def valid_pos
        valid = []
        (0...@height).each do |row|
            (0...@height).each do |col|
                valid << [row,col] if self[[row,col]] == " "
            end
        end
        valid
    end
end

# board = Board.new(4)
# board.flip_card([2,3])


# board.generate_deck
# board.populate
# board.render
# p board.grid_hash
# p board.won?

# p board.cards
# p board.total_pairs
# grid = Array.new (4) {|x| Array.new(4) }