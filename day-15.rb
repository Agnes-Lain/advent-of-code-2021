require_relative 'common'
require "matrix"


class Day15 < AdventDay
  def first_part
    # board = Matrix.zero(input[0].size, input.size)
    @infinity = 1000
    # m = Matrix[*input]
    shortest_path_wg(input)
  end

  def second_part
  end

  private

  def shortest_path_wg(matrix, init = 0)
    vertex = []
    v = matrix[0].length
    dist = []
    prev = []

    v.times do |i|
      dist << @infinity
      prev << -1
      vertex << i
    end

    dist[init] = 0

    while vertex.length > 0

      u = vertex.shift

      matrix[u].each_with_index do |i,j|
        next if i == 0
        alt =  dist[u] + i
        if alt < dist[j]
          dist[j] = alt
          prev[j]  = i
        end
      end
    end
    dist
  end

  def convert_data(data)
    super.map{|s| s.split("").map{|e| e.to_i }}
  end

  def debug_input
    "1163751742\n1381373672\n2136511328\n3694931569\n7463417111\n1319128137\n1359912421\n3125421639\n1293138521\n2311944581"
  end

end

Day15.solve
