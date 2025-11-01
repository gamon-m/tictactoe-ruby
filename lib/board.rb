require_relative "utils"
# Class for the game board
class Board
  include Utils

  def initialize
    @board = [[" ", " ", " "],
              [" ", " ", " "],
              [" ", " ", " "]]
  end

  def print_board
    @board.each_with_index do |row, i|
      puts "  | 0 | 1 | 2 |" if i.zero?
      puts "- + - + - + - +"
      puts "#{i} | #{row[0]} | #{row[1]} | #{row[2]} |"
      puts "- + - + - + - +" if i == @board.length - 1
    end
  end

  def make_move(player)
    puts "player #{player}'s turn"
    if player == 1
      pos_x, pos_y = select_pos
      @board[pos_x][pos_y] = "O"
    elsif player == 2
      pos_x, pos_y = select_pos
      @board[pos_x][pos_y] = "X"
    end
  end

  def win_condition?(player)
    if player == 1
      char = "O"
    elsif player == 2
      char = "X"
    end

    win = win_pattern?(char)

    return true if win == true

    false
  end

  def draw_condition?
    return true unless @board.flatten.include? " "

    false
  end

  private

  def select_pos
    puts "select position on the board by typing the positions like so row,column e.g. 0,0 or 2,1"
    while (input = gets.chomp)
      valid_input = false
      valid_input = true if check_input?(input) && valid_position?(input)
      return input[0].to_i, input[2].to_i if valid_input == true

      puts "invalid input, please try again"
    end
  end

  def valid_position?(pos)
    pos_x = pos[0].to_i
    pos_y = pos[2].to_i

    true if @board[pos_x][pos_y] == " "
  end

  def win_pattern?(char) # rubocop:disable Metrics
    @board.each do |row|
      return true if row.all?(char)
    end
    @board.transpose.each do |col|
      return true if col.all?(char)
    end
    n = @board.size
    diag_from_left = (0...n).map { |i| @board[i][i] }
    return true if diag_from_left.all?(char)

    diag_from_right = (0...n).map { |i| @board[i][n - 1 - i] }
    return true if diag_from_right.all?(char)

    false
  end
end
