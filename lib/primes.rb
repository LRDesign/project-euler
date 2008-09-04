# tools for generating and interacting with primes
module Primes
  ARRAY_DEFAULT_LIMIT = 10
  
  # generates an array containing all primes below options[:limit]
  # or the first options[:count] primes 
  def primes_array(options = {})
    # default limit of 100 primes
    options[:count]=10 unless options[:count] or options[:limit]
    primes = initialize_array(options)
    val = 5
    while within_limit(val, primes, options)
      primes << val unless primes.any? { |pp| val % pp == 0 }
      val += 2
    end
    primes
  end

  def initialize_array(options = {})
    primes = Array.new
    primes << 2
    unless (options[:count] and options[:count] < 2) or (options[:limit] and options[:limit] < 3)
      primes << 3 
    end
  end
  
  def within_limit(val, primes, options = {})
    return false if options[:limit] and val > options[:limit] 
    return false if options[:count] and primes.size >= options[:count]
    true
  end
  
  def first_primes
    @first_primes = primes_array(:count => 100)
  end
  
end

class PrimeClass
  include Primes
end
