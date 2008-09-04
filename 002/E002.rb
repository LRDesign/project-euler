require 'euler_solution.rb'

class E002 < EulerSolution
  LIMIT = 4000000

  def answer 
    a = 1
    b = 1
    sum = 0
    fib = a + b
    while (fib = a + b ) < LIMIT
      sum += fib if (fib%2)==0
      a = b
      b = fib  
    end 
    sum
  end
end