require 'euler_solution.rb'
require 'primes'
class E007 < EulerSolution
  include Primes
  
  def answer
    primes_array(:limit => 120000)[10000]    
  end
end  