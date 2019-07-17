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

    if board_new.move(game?,curr_mark)
    
#Losing_node is recursive where the base case is that the board is over AND the winner is opponent
#Recursive case it is the players turn and all the children nodes are losers for the player, 
# or it is the opponents turn and one of the children nodes is a losing node for the player with optimal play

  end

  def winning_node?(curr_mark)
    if board.over?
      board.winner = curr_mark


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
    children << TicTacToeNode.new()
  end

 


end
