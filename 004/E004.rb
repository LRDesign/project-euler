require File.dirname(__FILE__) + '/../euler_solution'

class E004 < EulerSolution
  START_HALF = 997
  STOP_HALF = 980

  # while (n > STOP_HALF)
  #   pal = 1000*n +
  #     n/100 + #ones
  #     10*((n%100)/10) + #tens
  #     
  # end

  # compute the N-digit palindrome
  # where n is the first N/2 digits
  def palindrome(n)
    1000*n + n/100 +  10*((n%100)/10) +  100*(n%10) #hundreds    
  end
  
  def three_digits?(n)
    (n < 1000) and (n > 99)
  end
  
  def three_digit_factor_pair(n)
    mm = sqrt(n).to_i
    div = 0
    while (mm > 99 and div < 1000) 
      div = n / mm
      rem = n % mm
      #puts "\t#{mm} (#{div} #{rem})"
      return true if (n % mm == 0) and three_digits?(div)
      mm-=1
    end
    false
  end
  
  def answer
    nn = START_HALF
    while three_digits?(nn)
      pp = palindrome(nn)
      puts "pp: #{pp}"
      return pp if three_digit_factor_pair(pp)
      nn -= 1
    end
    "no solution found"
  end
  
end
  