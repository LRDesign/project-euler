require 'euler_solution.rb'

module Blank
  def blank?
    self.nil? or self == ''
  end
end
class String; include Blank; end
class NilClass; include Blank; end

class E017 < EulerSolution
  LIMIT = 1000
 
  DIGITS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    0 => ''
  }

  TENS = {
    2 => 'twenty',
    3 => 'thirty',
    4 => 'forty',
    5 => 'fifty',
    6 => 'sixty',
    7 => 'seventy',
    8 => 'eighty',
    9 => 'ninety',
  }
  
  TEENS = {
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }
  
  def connect(a,b,glue)
    if (a.blank? or b.blank?)
      "#{a}#{b}"
    else
      "#{a}#{glue}#{b}"
    end
  end
  
  def tens_string(num)
    tens = num/10
    ones = num % 10
    if (num > 19)
      connect(TENS[tens], DIGITS[ones],'-')
    elsif (num > 9)
      TEENS[num]
    else
      DIGITS[ones]
    end  
  end
  
  def english(num)
    if num == 1000
      'one thousand'
    else
      h = num / 100
      t = num % 100
      hstr = (h > 0) ? "#{DIGITS[h]} hundred" : ''
      tstr = tens_string(t) 
      connect(hstr, tstr,' and ')
    end
  end
  
  def letters(num)
    english(num).count("a-zA-Z")
  end
  
  def answer
    (1..LIMIT).inject(0) {|sum, n| sum + letters(n) }
  end
end