require 'euler_solution.rb'
class E048 < EulerSolution
  LIMIT = 1000
  
  def answer
    big = (1..LIMIT).to_a.inject {|s,n| s + (n**n)}
    big % 10**10
  end
  
end