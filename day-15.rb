require_relative 'common'
require 'dijkstra'


class Day15 < AdventDay
  def first_part
    end_point = input.size - 1
    ob = Dijkstra.new(0, 1, input)
    ob

  end

  def second_part
  end

  private

  def convert_data(data)
    super.map{|s| s.split("").map{|e| e.to_i }}
  end

  def debug_input
    "1163751742\n1381373672\n2136511328\n3694931569\n7463417111\n1319128137\n1359912421\n3125421639\n1293138521\n2311944581"
  end

end

Day15.solve
