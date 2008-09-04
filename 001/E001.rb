require 'euler_solution.rb'

class E001 < EulerSolution
  
  def divisible?(x,y)
    x % y == 0
  end

  def answer
    total = 0
    (1...1000).to_a.each do |n|
      if divisible?(n,3) or divisible?(n,5)
        total += n
      end
    end 
    total   
  end
end
