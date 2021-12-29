require_relative 'common'
require "byebug"

class Day21 < AdventDay
  def first_part
    p1_init = input[0]
    p2_init = input[1]
    dice = 1
    roll_sum1 = 0
    roll_sum2 = 0
    count = 0
    while roll_sum1 < 1000 && roll_sum2 < 1000
      roll = dice * 3 + 3
      count += 1
      dice < 98 ? dice = dice + 3 : dice = (dice + 3) - 100
      p1_init = each_move(roll, p1_init)
      roll_sum1 += p1_init
      break if roll_sum1 >= 1000
      roll = dice * 3 + 3
      count += 1
      dice < 98 ? dice = dice + 3 : dice = (dice + 3) - 100
      p2_init = each_move(roll, p2_init)
      # byebug
      roll_sum2 += p2_init
      break if roll_sum2 >= 1000
    end
    # byebug
    [roll_sum1, roll_sum2].min * (count * 3)
  end

  def second_part
  end

  private

  def each_move(roll_sum, p_init)
    sum = roll_sum + p_init
    if sum <= 10
      return sum
    elsif sum % 10 == 0
      return 10
    else
      return sum.to_s[-1].to_i
    end
  end

  def convert_data(data)
    super.map{|arr| arr.split(": ")[1].to_i}
  end

  def debug_input
    "Player 1 starting position: 4\nPlayer 2 starting position: 8"
  end

end

Day21.solve
