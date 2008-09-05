require 'euler_solution.rb'
require 'primes'
class E012 < EulerSolution
  include Primes
  
  def triangle(n)
    ((n + 1) * n) / 2    
  end
  
  def sigma_0(n)
    prime_factors_hash(n).values.inject(1) { |prod, n| prod * (n + 1) }
  end
  
  def answer 
    n = 1
    max_divisors = 1
    begin
      n += 1
      div = sigma_0(triangle(n))
      if div > max_divisors
        max_divisors = div 
        puts "N #{n}: #{div}"       
      end
    end while max_divisors <= 500
    triangle(n)      
  end
end