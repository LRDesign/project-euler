require 'euler_solution.rb'
class E016 < EulerSolution
  def answer
    big = 2**1000
    sum = 0
    until big < 1
      (big, digit) =  big.divmod(10)
      sum += digit
    end
    sum
  end
end