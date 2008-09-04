require 'euler_solution.rb'
class E009 < EulerSolution
  
  def is_pythagorean_triple?(a,b,c)
    (a * a) + (b * b) == (c * c)
  end
  
end