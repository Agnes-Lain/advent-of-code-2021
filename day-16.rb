require_relative 'common'

class Day16 < AdventDay
  def first_part
    arr = []
    input.each_char do |char|
      arr << HASH[char]
    end
    bits = arr.join
    v_sum = 0
    version = to_decimal(bits[0..2])
    v_sum += version
    p "version = #{version}"
    package_id = to_decimal(bits[3..5])
    p "package_id = #{package_id}"
    length_type_ID = bits[6]
    if length_type_ID == "0"
      total_length_in_bits = to_decimal(bits[7..21])
      p "total_length_in_bits = #{total_length_in_bits}"
    else
      number_of_sub_packets = to_decimal(bits[7..17])
      p "number_of_sub_packets = #{number_of_sub_packets}"
    end
  end

  def second_part
  end

  private

  def decoder(bits, v_sum)
    version = to_decimal(bits[0..2])
    v_sum += version
    package_id = to_decimal(bits[3..5])
    if package_id == 4
      end_index = literal_index(bits, 6)
    else
      length_type_ID = bits[6]
      if length_type_ID == "0"
        total_length_in_bits = to_decimal(bits[7..21])
        # p "total_length_in_bits = #{total_length_in_bits}"
        decoder(bits[22..(22+total_length_in_bits)], v_sum)
      else
        number_of_sub_packets = to_decimal(bits[7..17])
        # p "number_of_sub_packets = #{number_of_sub_packets}"
        pack_count = 0
        decoder(bits[22..], v_sum)
      end
    end
  end

  def literal_index(bits, index)
    if bits[index] == "1"
      index += 5
      literal_value(bits[index..], index)
    else
      index +=5
    end
    index
  end

  def convert_data(data)
    super[0]
  end

  def debug_input
    # "8A004A801A8002F478"
    "38006F45291200"
  end

  HASH = {"0"=> "0000",
          "1" => "0001",
          "2" => "0010",
          "3" => "0011",
          "4" => "0100",
          "5" => "0101",
          "6" => "0110",
          "7" => "0111",
          "8" => "1000",
          "9" => "1001",
          "A" => "1010",
          "B" => "1011",
          "C" => "1100",
          "D" => "1101",
          "E" => "1110",
          "F" => "1111"
        }

  def to_decimal(binary)
    raise ArgumentError if binary.match?(/[^01]/)

    binary.reverse.chars.map.with_index do |digit, index|
      digit.to_i * 2**index
    end.sum
  end

end

Day16.solve
