require_relative 'common'
require "byebug"

class Day5 < AdventDay
  def first_part
    lines = input.select {|c| c[0][0] == c[1][0] || c[0][1] == c[1][1]}
    hash = {}
    lines.each do |points|
      x1 = points[0][0]
      y1 = points[0][1]
      x2 = points[1][0]
      y2 = points[1][1]
      if x1 == x2
        min = [y1, y2].min
        max = [y1, y2].max
        (min..max).each do |y|
          k = [x1, y]
          hash[k] ? hash[k] += 1 : hash[k] = 1
        end
      else
        min = [x1, x2].min
        max = [x1, x2].max
        (min..max).each do |x|
          k = [x, y1]
          hash[k] ? hash[k] += 1 : hash[k] = 1
        end
      end
    end
    final = hash.select { |_k,v|  v >= 2 }
    final.size
  end

  def second_part
    # lines = input.select {|c| c[0][0] == c[1][0] || c[0][1] == c[1][1]|| (c[0][0]-c[1][0]).abs == (c[0][1]-c[1][1]).abs }
    hash = {}
    input.each do |points|
      x1 = points[0][0]
      y1 = points[0][1]
      x2 = points[1][0]
      y2 = points[1][1]
      if x1 == x2
        min = [y1, y2].min
        max = [y1, y2].max
        (min..max).each do |y|
          k = [x1, y]
          hash[k] ? hash[k] += 1 : hash[k] = 1
        end
      elsif y1 == y2
        min = [x1, x2].min
        max = [x1, x2].max
        (min..max).each do |x|
          k = [x, y1]
          hash[k] ? hash[k] += 1 : hash[k] = 1
        end
      else
        x_min = [x1, x2].min
        x_max = [x1, x2].max
        y_min = [y1, y2].min
        y_max = [y1, y2].max
        if x_min == x1 && y_min == y1
          (x_min..x_max).each do |x|
            # byebug
            k = [x, y_min]
            hash[k] ? hash[k] += 1 : hash[k] = 1
            y_min += 1
          end
        elsif x_max == x1 && y_max == y1
          (x_min..x_max).each do |x|
            k = [x, y_min]
            hash[k] ? hash[k] += 1 : hash[k] = 1
            y_min += 1
          end
        else
          (x_min..x_max).each do |x|
            k = [x, y_max]
            hash[k] ? hash[k] += 1 : hash[k] = 1
            y_max -= 1
          end
        end
      end
    end
    final = hash.select { |_k,v|  v >= 2 }
    final.size
    # hash
  end

  private

  def convert_data(data)
    super.map {|s| s.split(" -> ").map{|c| c.split(",").map{|e| e.to_i }}}
  end

  def debug_input
    "0,9 -> 5,9\n8,0 -> 0,8\n9,4 -> 3,4\n2,2 -> 2,1\n7,0 -> 7,4\n6,4 -> 2,0\n0,9 -> 2,9\n3,4 -> 1,4\n0,0 -> 8,8\n5,5 -> 8,2"
  end
end

Day5.solve
