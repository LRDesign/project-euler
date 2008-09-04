require 'euler_solution.rb'
class E006 < EulerSolution
  LIMIT = 100
  def answer  
    sum = (1..LIMIT).inject { |s,n| s += n }
    sos = (1..LIMIT).inject { |s,n| s += n * n }
    sum * sum - sos
  end
end