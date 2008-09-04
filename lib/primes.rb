# tools for generating and interacting with primes
module Primes
  ARRAY_DEFAULT_LIMIT = 100
  
  # generates an array containing all primes below options[:limit]
  # or the first options[:count] primes 
  def primes_array(options = {})
    # default limit of 100 primes
    options[:count]=100 unless options[:count] or options[:limit]
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
    @first_primes = primes_array(:count => ARRAY_DEFAULT_LIMIT)
  end
  
  # a hash of the prime factors of n, with the number of occurrences of each
  def prime_factors_hash(n)
    var = n
    h = Hash.new
    
  end
  
  # finds the lowest prime factor of n and returns that factor
  # and the dividend in a hash
  def first_prime_factor(n)
    if factor = first_primes.find { |p| n % p == 0 }
      { :factor => factor, :dividend => n / factor }
    else
      { :factor => n, :dividend => 1 }
    end
  end
  
end

class PrimeClass
  include Primes
end
