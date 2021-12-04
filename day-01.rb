require_relative 'common'

class Day1 < AdventDay
  def first_part
    ex_num = input[0]
    # puts ex_sum
    increase_counter = 0
    input.each do |num|
      # Here, row is an array of columns
      increase_counter += 1 if num > ex_num
      ex_num = num
    end
    increase_counter
  end

  def second_part
    increase_counter2 = 0
    ex_sum = input[0..2].sum
    input.each_with_index do |num, index|
      if index < (input.size - 2)
        swift_sum = input[index..(index+2)].sum
        increase_counter2 += 1 if swift_sum > ex_sum
        # puts swift_sum
        ex_sum = swift_sum
      end
    end
    increase_counter2
  end

  private

  def convert_data(data)
    super.map(&:to_i)
  end

  def debug_input
    "12\n34\n56\n15\n20"
  end
end

Day1.solve
