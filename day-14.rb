require_relative 'common'

class Day14 < AdventDay
  def first_part
    s = get_string(input)
    hash = get_hash(input)
    step = 40
    step.times do
      arr = []
      for i in 0...(s.size-1)
        k = s[i..(i+1)]
        v = hash[k]
        if i == 0
          arr << s[i]
          arr << v
          arr << s[i+1]
        else
          arr << v
          arr << s[i+1]
        end
      end
      s = arr.join
    end
    count = count_s(s)
    a = count.values
    a.max - a.min
  end

  def second_part
  end

  private

  def count_s(s)
    hash = {}
    s.split("").each { |l| hash[l] ? hash[l] +=1 : hash[l] = 1 }
    hash
  end

  def get_string(input)
    input[0]
  end

  def get_hash(input)
    arr = input [2...input.size].map{|e| e.split(" -> ")}
    hash = {}
    arr.each { |pair| hash[pair[0]] = pair[1] }
    hash
  end

  def convert_data(data)
    super
  end

  def debug_input
    "NNCB\n\nCH -> B\nHH -> N\nCB -> H\nNH -> C\nHB -> C\nHC -> B\nHN -> C\nNN -> C\nBH -> H\nNC -> B\nNB -> B\nBN -> B\nBB -> N\nBC -> B\nCC -> N\nCN -> C"
  end

end

Day14.solve
