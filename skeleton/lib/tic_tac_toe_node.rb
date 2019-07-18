require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode 
  attr_reader :board, :next_mover_mark, :prev_move_pos
  attr_accessor :children
  def initialize(board, next_mover_mark, prev_move_pos = nil)
        @board = board
        @next_mover_mark = next_mover_mark
        @prev_move_pos = prev_move_pos
        # @tic_tac_toe = TicTacToe.new("player1", "player2")
        # @MARKS = [:X, :O]
  end

  def losing_node?(curr_mark)
    if board.over?
      return board.won? && board.winner != curr_mark
    board_new = board.dup
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
    if @board.over?
      @board.winner = curr_mark
    elsif self.next_mover_mark == curr_mark
      self.children.any?{|node| node.winning_node?(curr_mark)}
    else
      self.children.all?{|node| node.winning_node?(curr_mark)}
    end
 end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    #1 Return all possible game states one move after current node
    #2 Iterate through all the positions that are empty? on the board opbject
    #3 For each empty positon create a node by duping the board and putting a next_mover_mark in the position
    #4 Alternate the mark
    children_array = Array.new
    @board.rows.each_with_index do |row, idx1|
      row.each_with_index do |pos, idx2|
        
        if pos == nil && @next_mover_mark == :x
          dupe = @board.dup
          pos = [idx1, idx2]
          dupe[pos] = :x
          children_array << TicTacToeNode.new(dupe, :o, [idx1, idx2])

        elsif pos == nil && @next_mover_mark == :o
          dupe = @board.dup
          pos = [idx1, idx2]
          dupe[pos] = :x
          children_array << TicTacToeNode.new(dupe, :x, [idx1, idx2])
        end
      end
    end
    children_array
  end

  def reverse_mark
    if @next_mover_mark == :x
      @next_mover_mark = :o
    else
      @next_mover_mark = :x
    end
    @next_mover_mark
  end
end
