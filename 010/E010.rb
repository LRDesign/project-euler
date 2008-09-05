require 'euler_solution.rb'
require 'primes'
class E010 < EulerSolution
  include Primes
  LIMIT = 2000000
  
  def answer
    primes_array(:limit => LIMIT).inject { |sum, p| sum + p }
  end
end