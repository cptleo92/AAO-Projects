require_relative "./tile.rb"
require "byebug"
require "colorize"

class Board

  NEIGHBORS = [[-1,-1], [-1,0], [1,0], [0,1], [0,-1], [1,1], [1,-1], [-1,1]]

  attr_reader :size, :lost

  def initialize(size, num_mines)
    @size = size
    @num_mines = num_mines  
    @board = Array.new(size) {Array.new(size) {Tile.new}}
    @mines = []
    @lost = false
    # @player = Player.new
    seed_mines
  end

  def [](pos)
    @board[pos[0]][pos[1]]    
  end

  def []=(pos,val)
    @board[pos[0]][pos[1]] = val
  end

  def seed_mines
    mines_left = @num_mines
    
    until mines_left == 0
      rand_x = rand(0...@size)
      rand_y = rand(0...@size)    
      unless self[[rand_x,rand_y]].mine 
        self[[rand_x, rand_y]].set_mine     
        @mines << [rand_x, rand_y]
        mines_left -= 1 
      end
    end
 
    puts (@board.flatten.count {|tile| tile.mine}).to_s + " mines planted"
    
  end

  def render   
    puts "        :)        "
    title = ""
    (0...@size).each {|x| title += " " + x.to_s}
    puts title.colorize(:green)
    (0...@size).each do |y|
      puts "#{y.to_s.colorize(:green)}" + stringify(y)
    end
  end

  def render_over  
    puts "        :(        "
    title = ""
    (0...@size).each {|x| title += " " + x.to_s}
    puts title.colorize(:red)
    (0...@size).each do |y|
      puts "#{y.to_s.colorize(:red)}" + stringify(y)
    end
  end

  def stringify(row)
    str = ""
    @board[row].each {|tile| str += tile.value.to_s + " "}
    str
  end  

  def prompt
    puts "Enter a position (i.e. 2,3 or 0,0 or 5,4)."
    print ">"
    pos = input_pos
    puts "Click or flag? (c/f)"
    print ">"
    click = click_or_flag

    if click == "c"    
      reveal(pos)
    else
      flag(pos)
    end
  end

  def mine?(pos)
    self[pos].mine
  end

  def revealed?(pos)
    self[pos].revealed
  end

  def value(pos)
    self[pos].value
  end

  def value=(pos,val)
    self[pos].value = val
  end


  def input_pos
    pos = nil
    until pos && valid_pos?(pos)
       
        begin
          pos = gets.chomp.split(",").map(&:to_i)      
        rescue
          puts "Invalid position entered"
          puts ""

          pos = nil
        end
    end
    pos
  end

  def valid_pos?(pos)
    x, y = pos[0], pos[1]
    return false if x == nil || y == nil
    x.between?(0, @size-1) && y.between?(0, @size-1) && pos.is_a?(Array)   
          
  end

  def click_or_flag
    click = nil
    until click && click.length == 1         
        click = gets.chomp
    end
    click
  end

  def reveal(pos)
    if mine?(pos)
      lose(pos)    
    else
      keep_revealing(pos)    
      render
    end        
  end

  def keep_revealing(pos)
    neighbors = adjacent_mines(pos)
    num_nearby = neighbors.count {|nei| mine?(nei)}
    self[pos].revealed = true
    if num_nearby == 0
        self[pos].value = " "        
        neighbors.each {|nei| keep_revealing(nei) unless mine?(nei) || revealed?(nei) }
    else
        self[pos].value = num_nearby.to_s
    end       
  end

  def flag(pos)
    self[pos].value = "F"
    render
  end

  def adjacent_mines(pos)
    x, y = pos[0], pos[1]
    neighbors = NEIGHBORS.map do |delta| 
      [delta[0] + x, delta[1] + y]
    end
    neighbors.select {|nei| valid_pos?(nei)}
  end

  def lose(pos)
    puts "You lose! :("
    self[pos].value = "B"
    @mines.each {|mine| self[mine].value = "B"}
    render_over    
    @lost = true   
  end

  def won?
    @mines.all? {|mine| self[mine].value == "F" }
  end
end
