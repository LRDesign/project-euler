require '../euler_solution'

class E004 < EulerSolution
  START_HALF = 997
  STOP_HALF = 980
  n = START_HALF

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
end
  