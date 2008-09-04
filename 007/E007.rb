require 'euler_solution.rb'
require 'primes'
class E007 < EulerSolution
  include Primes
  
  def answer
    primes_array(:count => 10001).last    
  end
end  