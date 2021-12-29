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

    for x in 0..x_max do
      v = recursive_x_dist(x)
      break if v > x_max
      if v >= x_min && v <= x_max
        x_possible << x
      end
    end
    x_possible.each do |ve|
      for y in
    end
  end

  def second_part
  end

  private
  def recursive_x_dist(n)
  # Base case
    return 0 if n < 1
    # Recursive call
    n + recursive_x_dist(n-1)
  end

  def y_dist(y, y_min, y_max)
    sum = 0
    step = 0
    while sum <= y_max && y > 0
      sum += y
      y = y - 1
      step += 1
    end
    return sum, step
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
