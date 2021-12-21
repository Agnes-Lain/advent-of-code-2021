require_relative 'common'

class Day17 < AdventDay
  def first_part
    x_min = input[0][0]
    x_max = input[0][1]
    y_min = input[1][0]
    y_max = input[1][1]
    puts "target area: x=#{x_min}..#{x_max}, y=#{y_min}..#{y_max}"

    step = 0
    x_possible = []
    x_init = 0
    y_init = 0
    x_velocity = 0
    y_velocity = 0

  end

  def second_part
  end

  private
  def recursive_x_dist(x)
  # Base case
    return 0 if n < 1
    # Recursive call
    n + recursive_x_dist(n-1)
  end

  def convert_data(data)
    super[0].split(": ")[1].split(", ").map{|e| e.split("=")[1].split("..").map{|n| n.to_i}}
  end

  # def x_move(x_velo)
  #   x_init = x_velo
  #   while x_init != 0
  #     if x_init > 0
  #       x
  #   end
  # end

  def debug_input
    "target area: x=20..30, y=-10..-5"
  end

end

Day17.solve
