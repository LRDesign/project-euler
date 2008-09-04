require 'euler_solution.rb'
require 'primes'
class E005 < EulerSolution
  include Primes
  
  def answer
      primes_array(:limit => 10).inject { |product, n| product * n }  
  end
end