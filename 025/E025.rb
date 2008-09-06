require 'euler_solution.rb'
class E025 < EulerSolution

  
  def answer
    thresh = 10**999
    a = [1, 1]
    count = 2
    until a[1] >= thresh
      a = (a << a[0]+a[1] )[1..2]
      count += 1
      #puts "#{count}: #{a[1]}"
    end
    count
  end
  
end