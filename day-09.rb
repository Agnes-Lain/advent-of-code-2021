require_relative 'common'
require "byebug"

class Day9 < AdventDay
  def first_part
    result = []
    size = input[0].size - 1
    x_limit = input.size - 1
    input.each_with_index do |arr, x|
      arr.each_with_index do |num, index|
        x > 0 ? upp = input[ x - 1 ][index] : upp = 9
        index > 0 ? left = input[x][index -1] : left = 9
        x < x_limit ? downn = input[ x + 1 ][index] : downn = 9
        index < size ? right = input[x][index+1] : right = 9
        # byebug
        if num < upp && num < left && num < downn && num < right
          # byebug
          result << num+1
        end
      end
    end
    result.sum
    # input
  end

  def second_part
    points = []
    size = input[0].size - 1
    x_limit = input.size - 1
    input.each_with_index do |arr, x|
      arr.each_with_index do |num, index|
        x > 0 ? upp = input[ x - 1 ][index] : upp = 9
        index > 0 ? left = input[x][index -1] : left = 9
        x < x_limit ? downn = input[ x + 1 ][index] : downn = 9
        index < size ? right = input[x][index+1] : right = 9
        # byebug
        if num < upp && num < left && num < downn && num < right
          # byebug
          points << [num, x, index]
        end
      end
    end
    result = []
    points.each do |point|
      sub_a = []
      v = point[0]
      x = point[1]
      y = point[2]
      x_up = x
      # area upleft includ center point
      round = 1


      result << sub_a
    end
    result
    points
  end

  private

  def search(x, y, r)

  end

  def convert_data(data)
    super.map{|s| s.split("").map{|n| n.to_i}}
  end

  def debug_input
    "2199943210\n3987894921\n9856789892\n8767896789\n9899965678"
  end

end

Day9.solve
