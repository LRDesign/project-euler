require 'euler_solution.rb'
class E020 < EulerSolution

  def factorial(n)
    n == 2 ? 2 : n * factorial(n-1)
  end
  
  def answer
    big = factorial(100)
    sum = 0
    until big < 1
      (big, digit) =  big.divmod(10)
      sum += digit
    end
    sum
  end
end