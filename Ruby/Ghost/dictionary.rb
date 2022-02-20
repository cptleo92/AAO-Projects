class Dictionary
    attr_reader :dictionary

    def initialize
        @dictionary = Hash.new {|h,k| h[k] = []}
        File.open("dictionary.txt").each do |word|
            first_char = word[0]
            @dictionary[first_char] += [word.chomp]
        
        end
    
    end

    def [](ele)
        @dictionary[ele]
    end
end