require 'euler_solution.rb'
require 'primes'
class E005 < EulerSolution
  include Primes
  
  
  def min_prime_factors(limit)
    arr = primes_array(:limit => limit)
    factor_count = Hash.new
    (2..limit).each do
      
    end
  end
  
  def answer
      primes_array(:limit => 10).inject { |product, n| product * n }  
  end
end