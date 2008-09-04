require 'euler_solution.rb'
require 'primes'
class E005 < EulerSolution
  include Primes
  
  
  def min_prime_factors(limit)
    arr = primes_array(:limit => limit)
    factor_count = Hash.new
    (2..limit).each do |n|
       h = prime_factors_hash(n)
       h.each do | factor, mult |
         factor_count[factor] ||= 0
         factor_count[factor] = [factor_count[factor], mult].max
       end   
    end
    factor_count
  end
  
  def answer
      flatten_mult_hash(min_prime_factors(20)).inject { |product, n| product * n }  
  end
end