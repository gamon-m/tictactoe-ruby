# Various utilities
module Utils
  def between_x_and_y?(num1, num2, input)
    (num1..num2).include?(input.to_i)
  end

  def check_input?(input)
    input.length == 3 &&
      between_x_and_y?(0, 2, input[0]) &&
      input[1] == "," &&
      between_x_and_y?(0, 2, input[2])
  end

  def switch_player(player)
    if player == 1
      player = 2
    elsif player == 2
      player = 1
    end

    player
  end
end
