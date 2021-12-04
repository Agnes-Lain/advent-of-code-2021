require_relative 'common'

class Day2 < AdventDay
  def first_part
    hash_d = {}
      input.each do |arr|
        k = arr[0]
        v = arr[1].to_i
        hash_d[k] ? hash_d[k] += v : hash_d[k] = v
      end
    hash_d["forward"] * (hash_d["down"] - hash_d["up"])
  end

  def second_part
    deepth = 0
    aim = 0
    distance = 0
    input.each do |arr|
      k = arr[0]
      v = arr[1].to_i
      if k == "forward"
        distance += v
        deepth += v*aim
      elsif k == "down"
        aim += v
      else
        aim -= v
      end
    end
    deepth * distance
  end

  private

  def convert_data(data)
    super.map { |s| s.split(" ")}
  end

  def debug_input
    "forward 5\ndown 5\nforward 8\nup 3\ndown 8\nforward 2"
  end

end

Day2.solve
