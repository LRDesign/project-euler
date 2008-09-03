#NUMBER = 1005
#NUMBER = 13195
NUMBER = 600851475143

root = Math.sqrt(NUMBER).to_i
puts root

def prime?(i)
  return false if i % 2 == 0
  root = Math.sqrt(i).to_i
  n = 3
  while n <= root
    return false if i % n == 0
    n+=2
  end
  true
end


i = root
while (i > 1)
  if NUMBER % i == 0
    puts "factor: #{i}"
    if prime?(i)
      puts "prime factor: #{i}"
      exit
    end  
  end
  i-=1
end