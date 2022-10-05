class Board

    attr_reader :grid, :boardsize
    
    def initialize(n)         
        @grid = Array.new(n) {Array.new(n, '_')}
        @boardsize = n
    end

    def valid?(position)
        if position[0] > (@boardsize - 1) || position[1] > (@boardsize - 1)
            return false
        end
        true 
    end     

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, val)
        @grid[position[0]][position[1]] = val
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'       
    end

    def legal_positions
        legal = []
        (0...@boardsize).each do |x|
            (0...@boardsize).each do |y|
                pos = [x,y]
                if valid?(pos) && empty?(pos)
                    legal << pos
                end
            end
        end
        legal
    end

    def place_mark(position, mark)
        if !valid?(position) 
            raise "position out of bounds"
        elsif !empty?(position)
            raise "position is already taken"
        else
            self[position] = mark
        end
    end

    def print
        @grid.each do |row|
            puts "|" + row.join(" ") + "|"
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? {|space| space == mark}                   
        end
        false
    end

    def win_col?(mark)
        # # [ [0,0], [1,0], [2,0] ]
        # # [ [0,1], [1,1], [2,1] ]
        # x = @grid.length
        # cols = Array.new(x) { Array.new([])} # [ [],[],[] ]
        
        # cols.each do |keys|
        #     (0...x).each do |first|

        #     end
        # end
       
        (0...@grid.length).each do |x|
            check = []
            @grid.each do |row|                            
            check << row[x]           
            end
            return true if check.all?(mark) 
        end
        false
    end

   
    def win_diagonal?(mark)   

        x = @grid.length

        diag1 = []
        (0...x).each do |idx|
            diag1 << [idx,idx]
        end

        diag2 = []
        i1 = 0
        i2 = x - 1
        while diag2.length < @grid.length
            diag2 << [i1, i2]
            i1 += 1
            i2 -= 1
        end
      
        return true if diag1.all? { |pos| self[pos] == mark }
        return true if diag2.all? { |pos| self[pos] == mark }
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? { |ele| ele == '_'}
    end

end

# board1 = Board.new(4)
# board1.place_mark([0,0],:X)
# board1.place_mark([0,1],:X)
# board1.place_mark([0,2],:X)
# board1.place_mark([0,3],:X)
# board1.print
# p board1.legal_positions
# p board1.win_diagonal?(:X)
# p board1.win_row?(:X)
# p board1.win_col?(:X)
# p board1.win?(:X)
# p board1.empty_positions?

# board2 = Board.new(5)
# board2.place_mark([4,0],:O)
# board2.place_mark([3,1],:O)
# board2.place_mark([2,2],:O)
# board2.place_mark([0,0],:O)
# board2.place_mark([1,3],:O)
# board2.place_mark([0,4],:O)
# board2.print
# p board2.win_diagonal?(:O)
# p board2.win_row?(:O)
# p board2.win_col?(:O)
# p board2.win?(:O)
# p board2.empty_positions?

# board3 = Board.new(6)
# board3.place_mark([0,0],:O)
# board3.place_mark([1,1],:O)
# board3.place_mark([1,0],:X)
# board3.place_mark([0,1],:O)
# board3.place_mark([1,2],:O)
# board3.place_mark([2,1],:O)
# board3.place_mark([2,0],:X)
# board3.place_mark([3,1],:O)
# board3.place_mark([0,2],:X)
# board3.place_mark([4,1],:O)
# board3.place_mark([5,1],:O)
# board3.print
# p board3.win_diagonal?(:O)
# p board3.win_row?(:O)
# p board3.win_col?(:O)
# p board3.win?(:O)
# p board3.empty_positions?