require_relative 'common'

class Day7 < AdventDay
  def first_part
    m = median(input)
    distance(input, m).sum
  end

  def second_part
    arr_mean = mean(input).ceil
    # d = distance(input, arr_mean)
    dis_a = ((arr_mean-1)..arr_mean).map {|n| fuel(input, n)}
    dis_a.min
  end

  private

  def convert_data(data)
    super[0].split(",").map{|n| n.to_i}
  end

  def debug_input
    "16,1,2,0,4,2,7,1,2,14"
  end

  def mean(array)
  array = array.inject(0) { |sum, x| sum += x } / array.size.to_f
  end

  def median(array, already_sorted=false)
    return nil if array.empty?
    array = array.sort unless already_sorted
    m_pos = array.size / 2
    return array.size % 2 == 1 ? array[m_pos] : mean(array[m_pos-1..m_pos])
  end

  def distance(arr, num)
    arr.map{ |n| (n - num).abs}
  end

  def fuel(arr, num)
    arr = arr.map do |n|
      d = (n - num).abs
      d > 0 ? (0..d).inject{|sum, x| sum += x } : 0
    end
    arr.sum
  end

end

Day7.solve
