require_relative 'common'
require "matrix"
require "byebug"

class Day13 < AdventDay
  def first_part
    i = input.index("")
    dots = input[0...i].map{|pair| pair.split(",").map{|e| e.to_i}}
    x_max = dots.map{|a| a[0]}.max
    y_max = dots.map{|a| a[1]}.max
    folds = input[(i + 1)...input.size].map{|e| e.split(" ")[2].split("=")}
    board = Matrix.zero(y_max+1, x_max+1)
    dots.each do |dot|
      board[dot[1],dot[0]] = 1
    end
    board = board.to_a
    new_board = fold(board, folds[0][0], folds[0][1])
    # new_board = fold(new_board, folds[1][0], folds[1][1])
    new_board.map{|arr| arr.sum }.sum
    # new_board
  end


  def second_part
    i = input.index("")
    dots = input[0...i].map{|pair| pair.split(",").map{|e| e.to_i}}
    x_max = dots.map{|a| a[0]}.max
    y_max = dots.map{|a| a[1]}.max+2
    folds = input[(i + 1)...input.size].map{|e| e.split(" ")[2].split("=")}
    board = Matrix.zero(y_max+1, x_max+1)
    dots.each do |dot|
      board[dot[1],dot[0]] = 1
    end
    board = board.to_a
    # board = fold(board, folds[0][0], folds[0][1])
    # byebug
    # board = fold(board, folds[1][0], folds[1][1])
    folds.each do |f|
      # byebug
      board = fold(board, f[0], f[1])
    end
    board
  end

  private

  def fold(board, dir, num)
    num = num.to_i
    if dir == "y"
      # byebug
      new_board = Matrix[*board[0...num]]
      board2 = Matrix[*board[(num+1)...board.size].reverse]
      new_board += board2
      return new_board.to_a.map{|arr| arr.map{|e| e > 1 ? e = 1 : e}}
    else
      trans_board = board.transpose
      new_board = Matrix[*trans_board[0...num]]
      board2 = Matrix[*trans_board[(num+1)...trans_board.size].reverse]
      new_board += board2
      new_board = new_board.transpose.to_a
      return new_board.map{|arr| arr.map{|e| e > 1 ? e = 1 : e}}
    end
  end

  def convert_data(data)
    super
  end

  def debug_input
    "6,10\n0,14\n9,10\n0,3\n10,4\n4,11\n6,0\n6,12\n4,1\n0,13\n10,12\n3,4\n3,0\n8,4\n1,10\n2,14\n8,10\n9,0\n\nfold along y=7\nfold along x=5"
  end

end

Day13.solve
