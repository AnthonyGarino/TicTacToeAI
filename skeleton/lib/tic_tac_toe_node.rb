require_relative 'tic_tac_toe'

class TicTacToeNode 
  attr_reader :children
  def initialize(board, next_mover_mark, prev_move_pos = nil)
        @board = board
        @next_mover_mark = next_mover_mark
        @prev_move_pos = prev_move_pos
        @tic_tac_toe = TicTacToe.new()
        MARKS = [:X, :O]
        @children = []
  end

  def losing_node?(curr_mark)
    if board.over?
      return board.won? && board.winner != curr_mark
    board_new = @board.dup
    elsif next_mover_mark == curr_mark
      return children.all?{|node| node.losing_node?(curr_mark)}
    else
      children.any?{|node| node.losing_node?(curr_mark)}
    end
  end

    # if board_new.move(game?,curr_mark)
    
#Losing_node is recursive where the base case is that the board is over AND the winner is opponent
#Recursive case it is the players turn and all the children nodes are losers for the player, 
# or it is the opponents turn and one of the children nodes is a losing node for the player with optimal play


  def winning_node?(curr_mark)
    if board.over?
      board.winner = curr_mark
    elsif self.next_mover_mark == curr_mark
      self.children.any?{|node| node.winning_node?(curr_mark)}
    else
      self.children.all?{|node| node.winning_node?(curr_mark)}
    end
 end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row, col]
    
    next unless board.empty?(pos)
    new_board = board.new
    new_board.place_mark(pos)
    children << TicTacToeNode.new(new_board, @next_mover_mark, @prev_move_pos)
      end
    end
    children
  end

 


end
