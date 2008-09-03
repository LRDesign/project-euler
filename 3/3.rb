#NUMBER = 27
#NUMBER = 13195
NUMBER = 600851475143

root = Math.sqrt(NUMBER).to_i
primes = []

#returns true if i is not evenly divided by
# any number in primes
def prime?(i, primes)
  primes.each do |n|
    return false if i % n == 0
  end
  true
end

# find the primes <= root
for i in (2..root)
  primes << i if prime?(i, primes)
end

factor = -1
primes.each do |p|
  factor = p if NUMBER % p == 0
end
puts factor

# 
# puts "----"
# primes.each do |n|
#   puts n
# end
