require_relative 'tic_tac_toe'
require "byebug"
class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)    
   
    if board.over?          
      return board.won? && board.winner != evaluator
    end

    if evaluator == @next_mover_mark            
      self.children.all? do |next_move|
        next_move.losing_node?(evaluator)
      end
    else      
      self.children.any? do |next_move|
        next_move.losing_node?(evaluator)
      end
    end    
    
  end

  def winning_node?(evaluator)    
    if board.over?
      return @board.winner == evaluator
    end    

    if evaluator == @next_mover_mark
      self.children.any? do |next_move|
        next_move.winning_node?(evaluator)
      end
    else
      self.children.all? do |next_move|
        next_move.winning_node?(evaluator)
      end
    end    
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []        

    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]

        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark            
                   
          
          if @next_mover_mark == :x
            next_mover_mark = :o
          else next_mover_mark = :x
          end 
          children << TicTacToeNode.new(new_board, next_mover_mark, pos)
        end

      end
    end    
    children
  end
end
