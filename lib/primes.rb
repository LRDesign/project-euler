# tools for generating and interacting with primes
module Primes
  ARRAY_DEFAULT_LIMIT = 100
    
  # implements the sieve of Erastosthenes and returns the resulting primes
  # in an array.   This version doesn't bother sieving or checking the even
  # numbers > 2
  def primes_array(options = {})
    limit = options[:limit] || ARRAY_DEFAULT_LIMIT
    field = Array.new(limit+1, true)
    # sieve the number field
    3.step(field.size / 2, 2) do |k|
      (3 * k).step(field.size, 2 * k) do |n|
        field[n] = false
      end
    end
    
    # collect the field into an array, starting with 3
    primes = [ 2 ]
    3.step(field.size, 2) do |n|
      primes << n if field[n] 
    end
    primes
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
  def prime_factors_hash(n, h = Hash.new)
    foo = first_prime_factor(n)
    h[foo[:factor]] = h[foo[:factor]].nil? ? 1 : h[foo[:factor]] + 1
    if (foo[:dividend] == 1)
      h
    else
      prime_factors_hash(foo[:dividend],h)
    end
  end
  
  def prime_factors(n)
    flatten_mult_hash(prime_factors_hash(n)).sort
  end
  
  def flatten_mult_hash(h)
    arr = []
    h.each do |f, mult| 
      mult.times { arr << f }
    end    
    arr
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
