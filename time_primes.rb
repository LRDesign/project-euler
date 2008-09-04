#!/usr/bin/ruby
$: << File.join(File.expand_path(File.dirname(__FILE__), "lib"))

require 'tools'
require 'primes'
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

(arr, dur) = elapse { @p.primes_array(:limit => LIMIT) }
puts "Old method did it in #{dur} sec"
(arr2, dur) = elapse { @p.primes_array_sieved(:limit => LIMIT) }
puts "New method did it in #{dur} sec"