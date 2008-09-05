require 'euler_solution.rb'
require 'primes'
class E012 < EulerSolution
  include Primes
  
  def triangle(n)
    ((n + 1) * n) / 2    
  end
  
  def sigma_0(n)
    factor(n).values.inject(1) { |prod, n| prod * (n + 1) }
  end
  
  def count_factors(n)
    number = n
    primes = primes_array
    pn = 0
    count = 1
    until number == 1 or (primes[pn] * primes[pn]) > n
      current = 1
      while (number % primes[pn]).zero?
        number /= primes[pn]
        current += 1
      end
      count *= current
      pn += 1
    end
    count
  end
  
  def answer 
    n = 1
    max_divisors = 1
    begin
      n += 1
      div = count_factors(triangle(n))
      if div > max_divisors
        max_divisors = div 
        puts "N #{n}: #{div}"       
      end
    end while max_divisors <= 500
    triangle(n)      
  end
end