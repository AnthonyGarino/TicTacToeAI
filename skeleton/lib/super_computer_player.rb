require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    winner_move(game,mark)
    # node = TicTacToeNode.new(game.board,mark,prev_position)
    moves = @board.node.children
    winning_node = moves.any{|move| move.winning_node?(mark)}
    if winning_node
      return winning_node.prev_position
    end

    non_losing_node = moves.any{|move| !move.losing_node(mark)}
    if non_losing_node
      return non_losing_node.prev_position
    end

    raise "it looks like I am going to lose"

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end


# class ComputerPlayer
#   attr_reader :name

#   def initialize
#     @name = "Tandy 400"
#   end

#   def move(game, mark)
#     winner_move(game, mark) || random_move(game)
#   end

#   private
#   def winner_move(game, mark)
#     (0..2).each do |row|
#       (0..2).each do |col|
#         board = game.board.dup
#         pos = [row, col]

#         next unless board.empty?(pos)
#         board[pos] = mark

#         return pos if board.winner == mark
#       end
#     end

#     # no winning move
#     nil
#   end

#   def random_move(game)
#     board = game.board
#     while true
#       range = (0..2).to_a
#       pos = [range.sample, range.sample]

#       return pos if board.empty?(pos)
#     end
#   end
# end