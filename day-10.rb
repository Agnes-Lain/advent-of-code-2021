require_relative 'common'
require "byebug"

class Day10 < AdventDay
  def first_part
    cleaned = input.map do |s|
      recursiv_remove(s)
    end
    a = []
    cleaned.each do |s|
      if s.match(CLOSE) != nil
        a << s.match(CLOSE)[0]
      end
    end
    a.map{|e| SCORE[e]}.sum
  end

  def second_part
    cleaned = input.map do |s|
      recursiv_remove(s)
    end
    arr = cleaned.select {|s| s if s.match(CLOSE) == nil}
    arr.map {|s| total(s)}.sort[(arr.size/2)]
  end

  private

  def convert_data(data)
    super
  end

  def debug_input
    "[({(<(())[]>[[{[]{<()<>>\n[(()[<>])]({[<{<<[]>>(\n{([(<{}[<>[]}>{[]{[(<()>\n(((({<>}<{<{<>}{[]{[]{}\n[[<[([]))<([[{}[[()]]]\n[{[{({}]{}}([{[{{{}}([]\n{<[[]]>}<{[{[{[]{()[[[]\n[<(<(<(<{}))><([]([]()\n<{([([[(<>()){}]>(<<{{\n<{([{{}}[<[[[<>{}]]]>[]]"
  end

  PATTERN = /(<>|\[\]|\{}|\(\))/
  CLOSE = /(>|\]|}|\))/
  SCORE = {")"=> 3, "]" => 57, "}"=> 1197,">"=> 25137}
  SCORE1 = {")"=> 1, "]"=> 2, "}"=> 3, ">"=> 4}

  def remove_chuck(s)
    s.gsub!(PATTERN, "")
  end

  def recursiv_remove(s)
    st = s
    return st if remove_chuck(st) == nil
    while remove_chuck(st) != nil
      # byebug
      break if remove_chuck(st) == nil
    end
    st
  end

  def total(s)
    score = 0
    s.reverse.split("").each do |chuck|
      score = score * 5
      score += score(chuck)
    end
    score
  end

  def score(chuck)
    case chuck
    when "("
      return SCORE1[")"]
    when "["
      return SCORE1["]"]
    when "{"
      return SCORE1["}"]
    else
      return SCORE1[">"]
    end
  end


end

Day10.solve
