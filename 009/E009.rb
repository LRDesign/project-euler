require 'euler_solution.rb'
class E009 < EulerSolution
  
  LIMIT = 1000
  
  def is_pythagorean_triple?(a,b,c)
    (a * a) + (b * b) == (c * c)
  end

  def answer
    for c in (1..(LIMIT-2))
      for a in (1..(LIMIT-1-c))
        b = LIMIT - a - c
        if is_pythagorean_triple?(a, b, c) 
          #puts "#{a} #{b} #{c} "+ (a + b + c).to_s
          return a * b * c 
        end
      end
    end
    0
  end
end