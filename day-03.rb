require_relative 'common'

class Day3 < AdventDay
  def first_part
    a = input.transpose
    gamma = []
    epsilon = []
    a.each do | s |
      one = s.count("1")
      zero = s.count("0")
      if one > zero
        gamma << "1"
        epsilon << "0"
      else
        gamma << "0"
        epsilon << "1"
      end
    end
    gamma_f = to_decimal(gamma.join)
    epsilon_f = to_decimal(epsilon.join)
    gamma_f * epsilon_f
  end

  def second_part
    oxygen = input
    co2 = input
    12.times do |t|
      if oxygen.size > 1
        # binding.pry
        o_a = oxygen.transpose
        if o_a[t].count("1") >= o_a[t].count("0")
          oxygen = oxygen.select {|a| a[t] == "1"}
        else
          oxygen = oxygen.select {|a| a[t] == "0"}
        end
      end
    end

    12.times do |t|
      if co2.size > 1
        c_a = co2.transpose
        if c_a[t].count("0") <= c_a[t].count("1")
          co2 = co2.select {|a| a[t]=="0"}
        else
          co2 = co2.select {|a| a[t] == "1"}
        end
      end
    end
    o = to_decimal(oxygen.flatten.join())
    c = to_decimal(co2.flatten.join())
    o * c
  end

  private

  def convert_data(data)
    super.flatten.map {|s| s.split("")}
  end

  def to_decimal(binary)
    raise ArgumentError if binary.match?(/[^01]/)

    binary.reverse.chars.map.with_index do |digit, index|
      digit.to_i * 2**index
    end.sum
  end

  def selector(array, s_num, s_num2)
    arr = array
    arr[0].size .times do |t|
      if arr.size > 1
        c_a = arr.transpose
        if c_a[t].count(s_num) <= c_a[t].count(s_num2)
          arr = arr.select {|a| a[t]==s_num}
        else
          arr = arr.select {|a| a[t] == s_num2}
        end
      end
    end
    arr
  end

  def debug_input
    "00100\n11110\n10110\n10111\n10101\n01111\n00111\n11100\n10000\n11001\n00010\n01010"

  end
end

Day3.solve
