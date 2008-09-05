#!/usr/bin/ruby
$: << File.join(File.expand_path(File.dirname(__FILE__), "lib"))

require 'tools'
require 'primes'
require 'yaml'
include Tools
include Primes

LIMIT = 1000
@p = PrimeClass.new


# # Code to test that the two methods really do the same thing
# 3.upto(LIMIT) do |n|
#   options = {:limit => n }  
#   if  (a1 = @p.primes_array(options)) != (a2 = @p.primes_array_sieved(options))
#     puts " mismatch on #{n}:"
#     0.upto([a1.size,a2.size].max) do |i|
#       puts "#{a1[i]} - #{a2[i]}"
#     end
#     exit
#   end
# end

FOO = 76576500

(hash, dur) = elapse { @p.prime_factors_hash(FOO, Hash.new) }
puts "Old method did it in #{dur} sec"
(hash2, dur) = elapse { @p.factorize(FOO) }
puts "New method did it in #{dur} sec"

if (hash == hash2)
  puts "hashes were equal"
else
  puts "hashes were not equal"
end

#puts hash.to_yaml
puts hash2.to_yaml
