require 'euler_solution.rb'

class E003 < EulerSolution
  #NUMBER = 1005
  #NUMBER = 13195
  NUMBER = 600851475143


  def prime?(i)
    return false if i % 2 == 0
    root = Math.sqrt(i).to_i
    n = 3
    while n <= root
      return false if i % n == 0
      n+=2
    end
    true
  end

  def answer
    root = Math.sqrt(NUMBER).to_i
    puts root
    i = root
    while (i > 1)
      if NUMBER % i == 0
        puts "factor: #{i}"
        if prime?(i)
          puts "prime factor: #{i}"
          return i
        end  
      end
      i-=1
    end
  end

end  