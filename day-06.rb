require_relative 'common'
require "byebug"

class Day6 < AdventDay
  def first_part
    new_arr = input
    new_born = []
    circle = 0
    while circle < 80
      new_arr.each_with_index do |day, i|
        # byebug
        if day == 0
          new_born << 8
          new_arr[i] = 6
        else
          new_arr[i] -= 1
        end
      end
      circle += 1
      new_arr += new_born
      new_born = []
    end
    new_arr.size
  end

  def second_part
    hash = {}
    circle = 0
    new_h = {}
    input.each{|n| hash[n] ? hash[n] += 1 : hash[n] = 1 }
    while circle < 256
      hash.each do |k, v|
        if k == 0
          new_h[8] ? new_h[8] += v : new_h[8] = v
          new_h[6] ? new_h[6] += v : new_h[6] = v
        else
          new_h[k-1] ? new_h[k-1] += v : new_h[k-1] = v
        end
      end
      # byebug
      circle += 1
      hash = new_h
      new_h = {}
    end
    hash.values.sum
  end

  private

  def convert_data(data)
    super[0].split(",").map{|n| n.to_i}
  end

  def debug_input
    "3,4,3,1,2"
  end

end

Day6.solve

