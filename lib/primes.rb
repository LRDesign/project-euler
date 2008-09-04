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
    @foo = 0
    while within_limit(val, primes, options)
      # if primes.size != @foo && primes.size % 100 == 0         
      #   puts primes.size 
      #   @foo = primes.size
      # end
      primes << val unless primes.any? { |pp| val % pp == 0 }
      val += 2
    end
    primes
  end

  def initialize_array(options = {})
    primes = [ 2 ]
    unless (options[:count] and options[:count] < 2) or (options[:limit] and options[:limit] < 3)
      primes << 3 
    end
  end
  
  # implements the sieve of Erastosthenes and returns the resulting primes
  # in an array.   This version doesn't bother sieving or checking the even
  # numbers > 2
  def primes_array_sieved(options = {})
    if options[:limit]
      limit = options[:limit]
      field = Array.new(limit+1, true)
      sieve(field)
    else
      primes = []
      times = 0
      while primes.size < options[:count]
        field = Array.new(1000, true)
        primes = sieve(field, primes, 1000*times)
        
      end      
    end
  end
  
  # marks false all the entries in the array field whose indices are
  # multiples of values in the array "primes", assuming that the
  # index is offset by offset.
  def sieve(field, primes = [2], offset = 0)
    primes << 2 unless primes.include?(2)
        
    # if we have some stored primes, sieve those     
    field = sieve_existing(field, primes, offset) if primes.size > 1    
    
    if primes.size > 1
      start = [3, primes.max+2].max
    else
      start = 3
    end
        
    # sieve the number field
    start.step( (field.size / 2)-offset, 2) do |k|
      (3 * k).step(field.size, 2 * k) do |n|
        field[n] = false
      end
    end
    
    #start with an even index
    start = (offset % 2 == 0) ? 1 : 0

    # collect the field into an array, starting with 3
    start.step(field.size, 2) do |n|
      primes << n+offset if field[n] and (n+offset > 2)
    end
    
    if primes.size
    primes    
  end
  
  # marks as false all entries in field whose indices (+offset) are
  # multiples of values in the array primes.  Ignores even numbers.
  def sieve_existing(field, primes, offset)
    # first, if there are any primes other than 2 in the supplied array,
    # then remove their multiples from the field
    if primes.size > 1
      primes[1..primes.size].each do |p|
        
        # start from the prime's first odd multiple that's greater than offset
        # but don't include the prime itself
        div = offset / p
        if div % 2 == 0 
          if (div > 0)
            start = (p * (1 + div) )
          else
            start = (p * (3 + div) )
          end
        else
          start = (p * (2 + div) )    
        end
        #puts "\n#{p} #{div} #{start}"
        start.step(field.size+offset, 2 * p) do |multiple|
          #puts "\t#{multiple}"
          field[multiple-offset] = false
        end
      end
    end
    field
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
