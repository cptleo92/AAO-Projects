class Computer
    attr_reader :known_cards

    def initialize 
        @known_cards = Hash.new{[]}
        @turn = 1
        @flip_next = []
    end

    def guess_pos(valid_arr)
        # return valid_arr.sample if @known_cards.length < 3
        @turn += 1
       
        if @turn.even?
            @flip_next = []
            guess = match_exists(@known_cards,valid_arr)
        elsif @flip_next != []                        
            guess = @flip_next
            @flip_next = []           
        else                
            guess = valid_arr.sample
        end
        
        guess

    end

    def match_exists(known,default)
        known.each do |card_value, pos|
            if pos.length > 1
                @flip_next = pos.pop
                guess = pos.pop
                @known_cards.delete(card_value)
                return guess
            end
        end
        return default.sample
    end

    def receive_revealed_card(pos, card)
        if @known_cards[card] == []
            @known_cards[card] = [pos]
        elsif !@known_cards[card].include?(pos)
            @known_cards[card] << pos # {Card.value => [[pos1][pos2]]}
        end
    end

end