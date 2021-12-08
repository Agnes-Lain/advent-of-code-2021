require_relative 'common'
require "byebug"

class Day8 < AdventDay
  def first_part
    count = 0
    input.each do |arr|
      arr[1].split(" ").each {|d| count +=1 if NUM_H.values.include?(d.size) }
    end
    count
  end

  def second_part
    a = []
    input.each do |arr|
      a << num_translater(arr)
    end
    a.sum
  end

  private

  def num_translater(array)
    arr = array[0].split(" ").map{ |s| s.split("").sort }
    temp_a = []
    hash = {}
    arr.each do |l|
      if l.size == 2
        hash["1"] = l
        temp_a << l
      elsif l.size == 3
        hash["7"] = l
        temp_a << l
      elsif l.size == 4
        hash["4"] = l
        temp_a << l
      elsif l.size == 7
        hash["8"] = l
        temp_a << l
      end
    end
    arr -= temp_a
    arr.each do |a|
      if a.size == 5 && (hash["1"] - a).empty?
        # byebug
        hash["3"] = a
        arr.delete(a)
        break
      end
    end
    arr.each do |a1|
      if a1.size == 6 && (hash["3"] - a1).empty?
        hash["9"] = a1
        arr.delete(a1)
      end
    end
    arr.each do |a2|
      if a2.size == 5 && (a2 - hash["9"]).empty?
        hash["5"] = a2
        arr.delete(a2)
      end
    end
    arr.each do |a3|
      if a3.size == 5
        hash["2"] = a3
        arr.delete(a3)
      end
    end
    arr.each do |a4|
      if (hash["5"] - a4).empty?
        hash["6"] = a4
      else
        hash["0"] = a4
      end
    end

    arr2 = array[1].split(" ").map{ |s| s.split("").sort }
    # arr.size
    arr_num = []
    arr2.each do |a5|
      arr_num << hash.key(a5)
    end
    arr_num.join.to_i
  end

  def convert_data(data)
    super.map {|s| s.split(" | ")}
  end

  def debug_input
    "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe\nedbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc\nfgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg\nfbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb\naecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea\nfgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb\ndbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe\nbdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef\negadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb\ngcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce"
  end

  NUM_H = {1=> 2, 4=> 4, 7=> 3, 8=> 7}

end

Day8.solve
