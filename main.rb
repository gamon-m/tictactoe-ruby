require_relative "lib/board"
require_relative "lib/utils"

board = Board.new

player = 1
board.print_board

loop do
  include Utils

  game_end = false

  board.make_move(player)

  if board.win_condition?(player)
    puts "player #{player} wins!"
    game_end = true
  elsif board.draw_condition?
    puts "it's a draw!"
    game_end = true
  end

  board.print_board

  break if game_end == true

  player = switch_player(player)
end
