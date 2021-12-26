require_relative 'common'
require "byebug"

class Day25 < AdventDay
  def first_part
    new_arr = input
    1000.times do |n|
      next_arr = move_south(move_east(new_arr))
      if next_arr == new_arr
        return n+1
      else
        new_arr = next_arr
      end
    end
  end

  def second_part
  end

  private
  def move_east(arr)
    # byebug
    y_edg = arr[0].size - 1
    new_arr = Marshal.load( Marshal.dump(arr) )
    arr.each_with_index do |a, x|
      a.each_with_index do |e, y|
        if y < y_edg
          if e == ">" && a[y+1] == "."
            new_arr[x][y+1] = ">"
            new_arr[x][y]= "."
          end
        else
          if e == ">" && a[0] == "."
            new_arr[x][0] = ">"
            new_arr[x][y]="."
          end
        end
      end
    end
    new_arr
  end

  def move_south(arr)
    x_edg = arr.size - 1
    new_arr = Marshal.load( Marshal.dump(arr) )
    arr.each_with_index do |a, x|
      a.each_with_index do |e, y|
        if x < x_edg
          if e == "v" && arr[x+1][y] == "."
            new_arr[x+1][y] = "v"
            new_arr[x][y] = "."
          end
        else
          if e == "v" && arr[0][y] == "."
            new_arr[0][y] = "v"
            new_arr[x][y] = "."
          end
        end
      end
    end
    new_arr
  end

  def convert_data(data)
    super.map {|s| s.split("")}
  end

  def debug_input
    # "...>...\n.......\n......>\nv.....>\n......>\n.......\n..vvv.."
    "v...>>.vv>\n.vv>>.vv..\n>>.>v>...v\n>>v>>.>.v.\nv>v.vv.v..\n>.>>..v...\n.vv..>.>v.\nv.v..>>v.v\n....v..v.>"
  end

end

Day25.solve
