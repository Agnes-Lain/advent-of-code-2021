require_relative 'common'
require "byebug"

class Day12 < AdventDay
  def first_part
    hash = input
    paths = []
    current_visited = []
    current_path = []
    find_node("start", ["start"], [], hash, paths)
    paths.size
  end

  def second_part
    hash = input
    paths = []
    current_visited = []
    current_path = []
    small_caves = hash.keys.select{|k| k != "start" && k != "end" && /[a-z]/.match?(k) }
    small_caves.each {|small_cave| find_next_node([small_cave, 0], "start", ["start"], [], hash, paths)}
    results = paths.map {|p| p.join(",")}
    uniques = results.uniq.sort
    uniques.size
  end

  private

  def find_node(node, current_path, current_visited, hash, paths)
    # puts "#{node}, #{current_path}, #{current_visited}"
    hash[node].each do |dest|
      # byebug
      if /[a-z]/.match?(dest)
        if current_visited.include?(dest)
          # bad path, ignore
            next
        end
      end
      new_path = current_path + [dest]
      new_visited = current_visited + [node]

      if dest == "end"
        paths.append(new_path)
      else
        find_node(dest, new_path, new_visited, hash, paths)
      end
    end
  end

  def find_next_node(small_cave, node, current_path, current_visited, hash, paths)
    # puts "#{node}, #{current_path}, #{current_visited}"
    hash[node].each do |dest|
      new_small_cave = [small_cave[0], small_cave[1]]
      # byebug
      if /[a-z]/.match?(dest)
        if current_visited.include?(dest)
          if dest == new_small_cave[0]
            if new_small_cave[1] == 1
              # bad path, ignore
              next
            else
              new_small_cave[1] += 1
            end
          else
            next
          end
        end
      end
      new_path = current_path + [dest]
      new_visited = current_visited + [node]

      if dest == "end"
        paths.append(new_path)
      else
        find_next_node(new_small_cave, dest, new_path, new_visited, hash, paths)
      end
    end
  end

  def convert_data(data)
    hash = {}
    super.map {|pair| pair.split("-")}.each do |pair|
      hash[pair[0]] ? hash[pair[0]] << pair[1] : hash[pair[0]] = [pair[1]]
      hash[pair[1]] ? hash[pair[1]] << pair[0] : hash[pair[1]] = [pair[0]]
    end
    hash
  end

  def debug_input
    # "start-A\nstart-b\nA-c\nA-b\nb-d\nA-end\nb-end"
    "dc-end\nHN-start\nstart-kj\ndc-start\ndc-HN\nLN-dc\nHN-end\nkj-sa\nkj-HN\nkj-dc"
  end

end

Day12.solve
