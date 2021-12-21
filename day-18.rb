require_relative 'common'
require 'json'

class Day18 < AdventDay
  def first_part
    result = []
    d = depth(result)
    input.each do |arr|
      result << arr
      d = depth(result)
      if d < 5
        next
      else
        result.each do |element|
          if element.class == Array && 
        end
      end
    end
  end

  def second_part
  end

  private

  def depth (arr)
    b, depth = arr.dup, 1

    until b==arr.flatten
      depth+=1
      b=b.flatten(1)
    end
    depth
  end

  def convert_data(data)
    super.map {|s| JSON.parse s}
  end

  def debug_input
    "[[[[4,3],4],4],[7,[[8,4],9]]]\n[1,1]"
    # "[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]\n[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]\n[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]\n[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]\n[7,[5,[[3,8],[1,4]]]]\n[[2,[2,2]],[8,[8,1]]]\n[2,9]\n[1,[[[9,3],9],[[9,0],[0,7]]]]\n[[[5,[7,4]],7],1]\n[[[[4,2],2],6],[8,7]]"
  end

end

Day18.solve
