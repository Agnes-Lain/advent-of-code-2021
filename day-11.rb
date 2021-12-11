require_relative 'common'
require "byebug"

class Day11 < AdventDay
  def first_part
    m = input
    step = 100
    f = 0
    (1..step).each do |s|
      m.each_with_index do |a, x|
        a.each_with_index do |e, y|
          m[x][y] += 1
        end
      end
      if scan_matrix?(m)
        # byebug
        while scan_matrix?(m)
          m.each_with_index do |a, x|
            a.each_with_index do |e, y|
              if e > 9
                m = flash(x, y, m)
                f += 1
              end
            end
          end
        end
      end
    end
    f
  end

  def second_part
    m = input
    step = 0
    f = 0
    until all_shine?(m) == true
      m.each_with_index do |a, x|
        a.each_with_index do |e, y|
          m[x][y] += 1
        end
      end
      if scan_matrix?(m)
        # byebug
        while scan_matrix?(m)
          m.each_with_index do |a, x|
            a.each_with_index do |e, y|
              if e > 9
                m = flash(x, y, m)
                f += 1
              end
            end
          end
        end
      end
      step += 1
    end
    step
  end

  private

  def convert_data(data)
    super.map{|s| s.split("").map{|l| l.to_i}}
  end

  def debug_input
    "5483143223\n2745854711\n5264556173\n6141336146\n6357385478\n4167524645\n2176841721\n6882881134\n4846848554\n5283751526"
  end

  def flash(x, y, m)
    # byebug
    if x > 0 && y > 0 && x < (m.size - 1) && y < (m[0].size - 1)
      # byebug
      (-1..1).each do |a|
        (-1..1).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    elsif x == 0 && y == 0
      (0..1).each do |a|
        (0..1).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    elsif x == (m.size - 1) && y == (m[0].size - 1)
      (-1..0).each do |a|
        (-1..0).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    elsif x == 0 && y == (m[0].size - 1)
      (0..1).each do |a|
        (-1..0).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    elsif x == (m.size - 1) && y == 0
      (-1..0).each do |a|
        (0..1).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    elsif x == 0 && y < (m[0].size - 1)
      (0..1).each do |a|
        (-1..1).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    elsif x < (m.size - 1) && y == 0
      (-1..1).each do |a|
        (0..1).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    elsif x == (m.size - 1) && y < (m[0].size - 1)
      (-1..0).each do |a|
        (-1..1).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    else
      (-1..1).each do |a|
        (-1..0).each do |b|
          m[x+a][y+b] += 1 if m[x+a][y+b] > 0
        end
      end
    end
    m[x][y] = 0
    m
  end

  def scan_matrix?(m)
    result = []
    m.each do |a|
      a.each{|e| result <<  (e > 9 ) }
    end
    result.include?(true)
  end

  def all_shine?(m)
    result = []
    m.each do |a|
      a.each{|e| result <<  (e == 0 ) }
    end
    result.all?(true)
  end

end

Day11.solve
